// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef SERVICES_GFX_COMPOSITOR_GRAPH_NODE_DEF_H_
#define SERVICES_GFX_COMPOSITOR_GRAPH_NODE_DEF_H_

#include <iosfwd>
#include <vector>

#include "base/macros.h"
#include "base/memory/ref_counted.h"
#include "mojo/services/gfx/composition/interfaces/nodes.mojom.h"
#include "services/gfx/compositor/graph/snapshot.h"

class SkCanvas;

namespace compositor {

class SceneContent;
class SceneContentBuilder;
class SceneDef;

// Represents a scene graph node.
//
// The base class mainly acts as a container for other nodes and does not
// draw any content of its own.
//
// Instances of this class are immutable and reference counted so they may
// be shared by multiple versions of the same scene.
class NodeDef : public base::RefCounted<NodeDef> {
 public:
  using Combinator = mojo::gfx::composition::Node::Combinator;

  NodeDef(uint32_t node_id,
          mojo::TransformPtr content_transform,
          mojo::RectPtr content_clip,
          Combinator combinator,
          const std::vector<uint32_t>& child_node_ids);

  uint32_t node_id() const { return node_id_; }
  const mojo::Transform* content_transform() const {
    return content_transform_.get();
  }
  const mojo::Rect* content_clip() const { return content_clip_.get(); }
  Combinator combinator() const { return combinator_; }
  const std::vector<uint32_t>& child_node_ids() const {
    return child_node_ids_;
  }

  // Gets a descriptive label.
  std::string FormattedLabel(const SceneContent* content) const;

  // Called by the scene content builder to traverse the node's dependencies
  // recursively and ensure they are included in the scene's local content.
  // Returns true if successful, false if the node contains linkage errors.
  virtual bool RecordContent(SceneContentBuilder* builder) const;

  // Called by the snapshot builder to traverse the node's dependencies
  // recursively follow links into other scenes, evaluate whether the
  // node can be rendered, and record which path was taken for the purposes
  // of satisfying combinators.
  virtual Snapshot::Disposition RecordSnapshot(const SceneContent* content,
                                               SnapshotBuilder* builder) const;

  // Called to record drawing commands from a snapshot.
  void RecordPicture(const SceneContent* content,
                     const Snapshot* snapshot,
                     SkCanvas* canvas) const;

 protected:
  friend class base::RefCounted<NodeDef>;
  virtual ~NodeDef();

  // Applies a unary function to the children selected by the node's
  // combinator rule during a snapshot.
  // Stops when |Func| returns false.
  // |Func| should have the signature |bool func(const NodeDef*)|.
  template <typename Func>
  void TraverseSnapshottedChildren(const SceneContent* content,
                                   const Snapshot* snapshot,
                                   const Func& func) const;

  virtual void RecordPictureInner(const SceneContent* content,
                                  const Snapshot* snapshot,
                                  SkCanvas* canvas) const;

 private:
  uint32_t const node_id_;
  mojo::TransformPtr const content_transform_;
  mojo::RectPtr const content_clip_;
  Combinator const combinator_;
  std::vector<uint32_t> const child_node_ids_;

  DISALLOW_COPY_AND_ASSIGN(NodeDef);
};

// Represents a rectangle node.
//
// Draws a solid color filled rectangle node underneath its children.
class RectNodeDef : public NodeDef {
 public:
  RectNodeDef(uint32_t node_id,
              mojo::TransformPtr content_transform,
              mojo::RectPtr content_clip,
              Combinator combinator,
              const std::vector<uint32_t>& child_node_ids,
              const mojo::Rect& content_rect,
              const mojo::gfx::composition::Color& color);

  const mojo::Rect& content_rect() const { return content_rect_; }
  const mojo::gfx::composition::Color& color() const { return color_; }

 protected:
  ~RectNodeDef() override;

  void RecordPictureInner(const SceneContent* content,
                          const Snapshot* snapshot,
                          SkCanvas* canvas) const override;

 private:
  mojo::Rect const content_rect_;
  mojo::gfx::composition::Color const color_;

  DISALLOW_COPY_AND_ASSIGN(RectNodeDef);
};

// Represents an image node.
//
// Draws an image filled rectangle underneath its children.
class ImageNodeDef : public NodeDef {
 public:
  ImageNodeDef(uint32_t node_id,
               mojo::TransformPtr content_transform,
               mojo::RectPtr content_clip,
               Combinator combinator,
               const std::vector<uint32_t>& child_node_ids,
               const mojo::Rect& content_rect,
               mojo::RectPtr image_rect,
               uint32 image_resource_id,
               mojo::gfx::composition::BlendPtr blend);

  const mojo::Rect& content_rect() const { return content_rect_; }
  const mojo::Rect* image_rect() const { return image_rect_.get(); }
  uint32_t image_resource_id() const { return image_resource_id_; }
  const mojo::gfx::composition::Blend* blend() const { return blend_.get(); }

  bool RecordContent(SceneContentBuilder* builder) const override;

 protected:
  ~ImageNodeDef() override;

  void RecordPictureInner(const SceneContent* content,
                          const Snapshot* snapshot,
                          SkCanvas* canvas) const override;

 private:
  mojo::Rect const content_rect_;
  mojo::RectPtr const image_rect_;
  uint32_t const image_resource_id_;
  mojo::gfx::composition::BlendPtr const blend_;

  DISALLOW_COPY_AND_ASSIGN(ImageNodeDef);
};

// Represents a scene node.
//
// Draws an embedded scene underneath its children.
class SceneNodeDef : public NodeDef {
 public:
  SceneNodeDef(uint32_t node_id,
               mojo::TransformPtr content_transform,
               mojo::RectPtr content_clip,
               Combinator combinator,
               const std::vector<uint32_t>& child_node_ids,
               uint32_t scene_resource_id,
               uint32_t scene_version);

  uint32_t scene_resource_id() const { return scene_resource_id_; }
  uint32_t scene_version() const { return scene_version_; }

  bool RecordContent(SceneContentBuilder* builder) const override;

  Snapshot::Disposition RecordSnapshot(const SceneContent* content,
                                       SnapshotBuilder* builder) const override;

 protected:
  ~SceneNodeDef() override;

  void RecordPictureInner(const SceneContent* content,
                          const Snapshot* snapshot,
                          SkCanvas* canvas) const override;

 private:
  uint32_t const scene_resource_id_;
  uint32_t const scene_version_;

  DISALLOW_COPY_AND_ASSIGN(SceneNodeDef);
};

// Represents a layer node.
//
// Composites its children to a layer and applies a blending operation.
class LayerNodeDef : public NodeDef {
 public:
  LayerNodeDef(uint32_t node_id,
               mojo::TransformPtr content_transform,
               mojo::RectPtr content_clip,
               Combinator combinator,
               const std::vector<uint32_t>& child_node_ids,
               const mojo::Size& size,
               mojo::gfx::composition::BlendPtr blend);

  const mojo::Size& size() const { return size_; }
  const mojo::gfx::composition::Blend* blend() const { return blend_.get(); }

 protected:
  ~LayerNodeDef() override;

  void RecordPictureInner(const SceneContent* content,
                          const Snapshot* snapshot,
                          SkCanvas* canvas) const override;

 private:
  mojo::Size const size_;
  mojo::gfx::composition::BlendPtr const blend_;

  DISALLOW_COPY_AND_ASSIGN(LayerNodeDef);
};

}  // namespace compositor

#endif  // SERVICES_GFX_COMPOSITOR_GRAPH_NODE_DEF_H_

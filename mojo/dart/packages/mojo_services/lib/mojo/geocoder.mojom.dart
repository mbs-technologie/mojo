// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library geocoder_mojom;

import 'dart:async';

import 'package:mojo/bindings.dart' as bindings;
import 'package:mojo/core.dart' as core;
import 'package:mojo_services/mojo/location.mojom.dart' as location_mojom;



class LocationType extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];
  static const ROOFTOP = "ROOFTOP";
  static const RANGE_INTERPOLATED = "RANGE_INTERPOLATED";
  static const GEOMETRIC_CENTER = "GEOMETRIC_CENTER";
  static const APPROXIMATE = "APPROXIMATE";

  LocationType() : super(kVersions.last.size);

  static LocationType deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static LocationType decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    LocationType result = new LocationType();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "LocationType("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class Bounds extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  location_mojom.Location northeast = null;
  location_mojom.Location southwest = null;

  Bounds() : super(kVersions.last.size);

  static Bounds deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static Bounds decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Bounds result = new Bounds();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.northeast = location_mojom.Location.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.southwest = location_mojom.Location.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(northeast, 8, false);
    
    encoder0.encodeStruct(southwest, 16, false);
  }

  String toString() {
    return "Bounds("
           "northeast: $northeast" ", "
           "southwest: $southwest" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["northeast"] = northeast;
    map["southwest"] = southwest;
    return map;
  }
}


class ComponentRestrictions extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(48, 0)
  ];
  String administrativeArea = null;
  String country = null;
  String locality = null;
  String postalCode = null;
  String route = null;

  ComponentRestrictions() : super(kVersions.last.size);

  static ComponentRestrictions deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static ComponentRestrictions decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ComponentRestrictions result = new ComponentRestrictions();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.administrativeArea = decoder0.decodeString(8, true);
    }
    if (mainDataHeader.version >= 0) {
      
      result.country = decoder0.decodeString(16, true);
    }
    if (mainDataHeader.version >= 0) {
      
      result.locality = decoder0.decodeString(24, true);
    }
    if (mainDataHeader.version >= 0) {
      
      result.postalCode = decoder0.decodeString(32, true);
    }
    if (mainDataHeader.version >= 0) {
      
      result.route = decoder0.decodeString(40, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(administrativeArea, 8, true);
    
    encoder0.encodeString(country, 16, true);
    
    encoder0.encodeString(locality, 24, true);
    
    encoder0.encodeString(postalCode, 32, true);
    
    encoder0.encodeString(route, 40, true);
  }

  String toString() {
    return "ComponentRestrictions("
           "administrativeArea: $administrativeArea" ", "
           "country: $country" ", "
           "locality: $locality" ", "
           "postalCode: $postalCode" ", "
           "route: $route" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["administrativeArea"] = administrativeArea;
    map["country"] = country;
    map["locality"] = locality;
    map["postalCode"] = postalCode;
    map["route"] = route;
    return map;
  }
}


class Options extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  ComponentRestrictions restrictions = null;
  location_mojom.Location location = null;
  String region = null;

  Options() : super(kVersions.last.size);

  static Options deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static Options decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Options result = new Options();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.restrictions = ComponentRestrictions.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.location = location_mojom.Location.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.region = decoder0.decodeString(24, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(restrictions, 8, true);
    
    encoder0.encodeStruct(location, 16, true);
    
    encoder0.encodeString(region, 24, true);
  }

  String toString() {
    return "Options("
           "restrictions: $restrictions" ", "
           "location: $location" ", "
           "region: $region" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["restrictions"] = restrictions;
    map["location"] = location;
    map["region"] = region;
    return map;
  }
}


class Geometry extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  location_mojom.Location location = null;
  LocationType locationType = null;
  Bounds viewport = null;
  Bounds bounds = null;

  Geometry() : super(kVersions.last.size);

  static Geometry deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static Geometry decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Geometry result = new Geometry();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.location = location_mojom.Location.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.locationType = LocationType.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(24, false);
      result.viewport = Bounds.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(32, true);
      result.bounds = Bounds.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(location, 8, false);
    
    encoder0.encodeStruct(locationType, 16, false);
    
    encoder0.encodeStruct(viewport, 24, false);
    
    encoder0.encodeStruct(bounds, 32, true);
  }

  String toString() {
    return "Geometry("
           "location: $location" ", "
           "locationType: $locationType" ", "
           "viewport: $viewport" ", "
           "bounds: $bounds" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["location"] = location;
    map["locationType"] = locationType;
    map["viewport"] = viewport;
    map["bounds"] = bounds;
    return map;
  }
}


class Result extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  bool partialMatch = false;
  Geometry geometry = null;
  String formattedAddress = null;
  List<String> types = null;

  Result() : super(kVersions.last.size);

  static Result deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static Result decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Result result = new Result();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.partialMatch = decoder0.decodeBool(8, 0);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.geometry = Geometry.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      result.formattedAddress = decoder0.decodeString(24, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(32, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.types = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.types[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeBool(partialMatch, 8, 0);
    
    encoder0.encodeStruct(geometry, 16, false);
    
    encoder0.encodeString(formattedAddress, 24, false);
    
    if (types == null) {
      encoder0.encodeNullPointer(32, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(types.length, 32, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < types.length; ++i0) {
        
        encoder1.encodeString(types[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "Result("
           "partialMatch: $partialMatch" ", "
           "geometry: $geometry" ", "
           "formattedAddress: $formattedAddress" ", "
           "types: $types" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["partialMatch"] = partialMatch;
    map["geometry"] = geometry;
    map["formattedAddress"] = formattedAddress;
    map["types"] = types;
    return map;
  }
}


class Status extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];
  static const OK = "OK";
  static const ZERO_RESULTS = "ZERO_RESULTS";
  static const OVER_QUERY_LIMIT = "OVER_QUERY_LIMIT";
  static const REQUEST_DENIED = "REQUEST_DENIED";
  static const INVALID_REQUEST = "INVALID_REQUEST";

  Status() : super(kVersions.last.size);

  static Status deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static Status decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Status result = new Status();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "Status("")";
  }

  Map toJson() {
    Map map = new Map();
    return map;
  }
}


class GeocoderAddressToLocationParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String address = null;
  Options options = null;

  GeocoderAddressToLocationParams() : super(kVersions.last.size);

  static GeocoderAddressToLocationParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static GeocoderAddressToLocationParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    GeocoderAddressToLocationParams result = new GeocoderAddressToLocationParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.address = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.options = Options.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(address, 8, false);
    
    encoder0.encodeStruct(options, 16, true);
  }

  String toString() {
    return "GeocoderAddressToLocationParams("
           "address: $address" ", "
           "options: $options" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["address"] = address;
    map["options"] = options;
    return map;
  }
}


class GeocoderAddressToLocationResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String status = null;
  List<Result> results = null;

  GeocoderAddressToLocationResponseParams() : super(kVersions.last.size);

  static GeocoderAddressToLocationResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static GeocoderAddressToLocationResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    GeocoderAddressToLocationResponseParams result = new GeocoderAddressToLocationResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.status = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      if (decoder1 == null) {
        result.results = null;
      } else {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.results = new List<Result>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.results[i1] = Result.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(status, 8, false);
    
    if (results == null) {
      encoder0.encodeNullPointer(16, true);
    } else {
      var encoder1 = encoder0.encodePointerArray(results.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < results.length; ++i0) {
        
        encoder1.encodeStruct(results[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "GeocoderAddressToLocationResponseParams("
           "status: $status" ", "
           "results: $results" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["status"] = status;
    map["results"] = results;
    return map;
  }
}


class GeocoderLocationToAddressParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  location_mojom.Location location = null;
  Options options = null;

  GeocoderLocationToAddressParams() : super(kVersions.last.size);

  static GeocoderLocationToAddressParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static GeocoderLocationToAddressParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    GeocoderLocationToAddressParams result = new GeocoderLocationToAddressParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.location = location_mojom.Location.decode(decoder1);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      result.options = Options.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeStruct(location, 8, false);
    
    encoder0.encodeStruct(options, 16, true);
  }

  String toString() {
    return "GeocoderLocationToAddressParams("
           "location: $location" ", "
           "options: $options" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["location"] = location;
    map["options"] = options;
    return map;
  }
}


class GeocoderLocationToAddressResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String status = null;
  List<Result> results = null;

  GeocoderLocationToAddressResponseParams() : super(kVersions.last.size);

  static GeocoderLocationToAddressResponseParams deserialize(bindings.Message message) {
    var decoder = new bindings.Decoder(message);
    var result = decode(decoder);
    if (decoder.excessHandles != null) {
      decoder.excessHandles.forEach((h) => h.close());
    }
    return result;
  }

  static GeocoderLocationToAddressResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    GeocoderLocationToAddressResponseParams result = new GeocoderLocationToAddressResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size == kVersions[i].size) {
            // Found a match.
            break;
          }
          throw new bindings.MojoCodecError(
              'Header size doesn\'t correspond to known version size.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.status = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      var decoder1 = decoder0.decodePointer(16, true);
      if (decoder1 == null) {
        result.results = null;
      } else {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.results = new List<Result>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.results[i1] = Result.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(status, 8, false);
    
    if (results == null) {
      encoder0.encodeNullPointer(16, true);
    } else {
      var encoder1 = encoder0.encodePointerArray(results.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < results.length; ++i0) {
        
        encoder1.encodeStruct(results[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "GeocoderLocationToAddressResponseParams("
           "status: $status" ", "
           "results: $results" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["status"] = status;
    map["results"] = results;
    return map;
  }
}

const int kGeocoder_addressToLocation_name = 0;
const int kGeocoder_locationToAddress_name = 1;
const String GeocoderName = null;

abstract class Geocoder {
  dynamic addressToLocation(String address,Options options,[Function responseFactory = null]);
  dynamic locationToAddress(location_mojom.Location location,Options options,[Function responseFactory = null]);

}


class GeocoderProxyImpl extends bindings.Proxy {
  GeocoderProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  GeocoderProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  GeocoderProxyImpl.unbound() : super.unbound();

  static GeocoderProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For GeocoderProxyImpl"));
    return new GeocoderProxyImpl.fromEndpoint(endpoint);
  }

  String get name => GeocoderName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kGeocoder_addressToLocation_name:
        var r = GeocoderAddressToLocationResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      case kGeocoder_locationToAddress_name:
        var r = GeocoderLocationToAddressResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          proxyError("Expected a message with a valid request Id.");
          return;
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          proxyError(
              "Message had unknown request Id: ${message.header.requestId}");
          return;
        }
        completerMap.remove(message.header.requestId);
        if (c.isCompleted) {
          proxyError("Response completer already completed");
          return;
        }
        c.complete(r);
        break;
      default:
        proxyError("Unexpected message type: ${message.header.type}");
        close(immediate: true);
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "GeocoderProxyImpl($superString)";
  }
}


class _GeocoderProxyCalls implements Geocoder {
  GeocoderProxyImpl _proxyImpl;

  _GeocoderProxyCalls(this._proxyImpl);
    dynamic addressToLocation(String address,Options options,[Function responseFactory = null]) {
      var params = new GeocoderAddressToLocationParams();
      params.address = address;
      params.options = options;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kGeocoder_addressToLocation_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    dynamic locationToAddress(location_mojom.Location location,Options options,[Function responseFactory = null]) {
      var params = new GeocoderLocationToAddressParams();
      params.location = location;
      params.options = options;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kGeocoder_locationToAddress_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class GeocoderProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Geocoder ptr;
  final String name = GeocoderName;

  GeocoderProxy(GeocoderProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _GeocoderProxyCalls(proxyImpl);

  GeocoderProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new GeocoderProxyImpl.fromEndpoint(endpoint) {
    ptr = new _GeocoderProxyCalls(impl);
  }

  GeocoderProxy.fromHandle(core.MojoHandle handle) :
      impl = new GeocoderProxyImpl.fromHandle(handle) {
    ptr = new _GeocoderProxyCalls(impl);
  }

  GeocoderProxy.unbound() :
      impl = new GeocoderProxyImpl.unbound() {
    ptr = new _GeocoderProxyCalls(impl);
  }

  factory GeocoderProxy.connectToService(
      bindings.ServiceConnector s, String url) {
    GeocoderProxy p = new GeocoderProxy.unbound();
    s.connectToService(url, p);
    return p;
  }

  static GeocoderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For GeocoderProxy"));
    return new GeocoderProxy.fromEndpoint(endpoint);
  }

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  Future responseOrError(Future f) => impl.responseOrError(f);

  Future get errorFuture => impl.errorFuture;

  int get version => impl.version;

  Future<int> queryVersion() => impl.queryVersion();

  void requireVersion(int requiredVersion) {
    impl.requireVersion(requiredVersion);
  }

  String toString() {
    return "GeocoderProxy($impl)";
  }
}


class GeocoderStub extends bindings.Stub {
  Geocoder _impl = null;

  GeocoderStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  GeocoderStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  GeocoderStub.unbound() : super.unbound();

  static GeocoderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) {
    assert(endpoint.setDescription("For GeocoderStub"));
    return new GeocoderStub.fromEndpoint(endpoint);
  }

  static const String name = GeocoderName;


  GeocoderAddressToLocationResponseParams _GeocoderAddressToLocationResponseParamsFactory(String status, List<Result> results) {
    var mojo_factory_result = new GeocoderAddressToLocationResponseParams();
    mojo_factory_result.status = status;
    mojo_factory_result.results = results;
    return mojo_factory_result;
  }
  GeocoderLocationToAddressResponseParams _GeocoderLocationToAddressResponseParamsFactory(String status, List<Result> results) {
    var mojo_factory_result = new GeocoderLocationToAddressResponseParams();
    mojo_factory_result.status = status;
    mojo_factory_result.results = results;
    return mojo_factory_result;
  }

  dynamic handleMessage(bindings.ServiceMessage message) {
    if (bindings.ControlMessageHandler.isControlMessage(message)) {
      return bindings.ControlMessageHandler.handleMessage(this,
                                                          0,
                                                          message);
    }
    assert(_impl != null);
    switch (message.header.type) {
      case kGeocoder_addressToLocation_name:
        var params = GeocoderAddressToLocationParams.deserialize(
            message.payload);
        var response = _impl.addressToLocation(params.address,params.options,_GeocoderAddressToLocationResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kGeocoder_addressToLocation_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kGeocoder_addressToLocation_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      case kGeocoder_locationToAddress_name:
        var params = GeocoderLocationToAddressParams.deserialize(
            message.payload);
        var response = _impl.locationToAddress(params.location,params.options,_GeocoderLocationToAddressResponseParamsFactory);
        if (response is Future) {
          return response.then((response) {
            if (response != null) {
              return buildResponseWithId(
                  response,
                  kGeocoder_locationToAddress_name,
                  message.header.requestId,
                  bindings.MessageHeader.kMessageIsResponse);
            }
          });
        } else if (response != null) {
          return buildResponseWithId(
              response,
              kGeocoder_locationToAddress_name,
              message.header.requestId,
              bindings.MessageHeader.kMessageIsResponse);
        }
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Geocoder get impl => _impl;
  set impl(Geocoder d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "GeocoderStub($superString)";
  }

  int get version => 0;
}



// WARNING: DO NOT EDIT. This file was generated by a program.
// See $MOJO_SDK/tools/bindings/mojom_bindings_generator.py.

library network_error_mojom;
import 'package:mojo/bindings.dart' as bindings;




class NetworkError extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int code = 0;
  String description = null;

  NetworkError() : super(kVersions.last.size);

  NetworkError.init(
    int this.code, 
    String this.description
  ) : super(kVersions.last.size);

  static NetworkError deserialize(bindings.Message message) =>
      bindings.Struct.deserialize(decode, message);

  static NetworkError decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkError result = new NetworkError();
    var mainDataHeader = bindings.Struct.checkVersion(decoder0, kVersions);
    if (mainDataHeader.version >= 0) {
      
      result.code = decoder0.decodeInt32(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.description = decoder0.decodeString(16, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    const String structName = "NetworkError";
    String fieldName;
    try {
      fieldName = "code";
      encoder0.encodeInt32(code, 8);
      fieldName = "description";
      encoder0.encodeString(description, 16, true);
    } on bindings.MojoCodecError catch(e) {
      bindings.Struct.fixErrorMessage(e, fieldName, structName);
      rethrow;
    }
  }

  String toString() {
    return "NetworkError("
           "code: $code" ", "
           "description: $description" ")";
  }

  Map toJson() {
    Map map = new Map();
    map["code"] = code;
    map["description"] = description;
    return map;
  }
}




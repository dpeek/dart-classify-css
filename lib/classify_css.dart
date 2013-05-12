// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library classify_css;

import 'package:csslib/parser.dart';
 import 'package:source_maps/source_maps.dart';

String classifyCss(String src) {
  var buf = new StringBuffer();
  var file = new SourceFile.text(null, src);
  var tokenizer = new Tokenizer(file, src, false);
  var token = tokenizer.next();
  while (token.kind != TokenKind.END_OF_FILE) {
    switch (token.kind) {
      case TokenKind.COMMENT:
        _addSpan(buf, Classification.COMMENT, token.text);
      break;
      case TokenKind.IDENTIFIER:
        _addSpan(buf, Classification.KEYWORD, token.text);
      break;
      case TokenKind.INTEGER:
      case TokenKind.HEX_INTEGER:
      case TokenKind.DOUBLE:
      case TokenKind.PERCENT:
        _addSpan(buf, Classification.NUMBER, token.text);
      break;
      default:
        buf.write(token.text);
    }
//    print('> ${token.kind} ${token.text}');
    token = tokenizer.next();
  }
  
  return buf.toString();
}

class Classification {
  static const NONE = "";
  static const ERROR = "e";
  static const COMMENT = "c";
  static const IDENTIFIER = "i";
  static const KEYWORD = "k";
  static const OPERATOR = "o";
  static const STRING = "s";
  static const NUMBER = "n";
  static const PUNCTUATION = "p";
  static const TYPE_IDENTIFIER = "t";
  static const SPECIAL_IDENTIFIER = "r";
  static const ARROW_OPERATOR = "a";
  static const STRING_INTERPOLATION = 'si';
}

String _addSpan(StringBuffer buffer, String cls, String text) {
  buffer.write('<span class="$cls">${_escapeHtml(text)}</span>');
}

/// Replaces `<`, `&`, and `>`, with their HTML entity equivalents.
String _escapeHtml(String html) {
  return html.replaceAll('&', '&amp;')
             .replaceAll('<', '&lt;')
             .replaceAll('>', '&gt;');
}

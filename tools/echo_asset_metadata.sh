#!/bin/bash

# AGMO loongyeat: Modified from
# https://github.com/flutter/photobooth/blob/main/tool/generate_asset_metadata.sh
# 
# Script used to analyze bundled assets and generate a dart file which contains
# the relevant metadata needed at runtime without forcing the application to
# download the assets.
#
# Usage:
# sh tools/echo_asset_metadata.sh > path/to/assets.g.dart

set -e

echo "// GENERATED CODE - DO NOT MODIFY BY HAND"
echo ""
echo "import 'package:flutter/widgets.dart';"
echo "import 'package:flutter_mvvm_stacked_template/app/app.dart';"
echo ""
echo "class Assets {"

props=assets/images/*.png

for prop in $props
do
    width=$(sips -g pixelWidth $prop | tail -n1 | cut -d" " -f4)
    height=$(sips -g pixelHeight $prop | tail -n1 | cut -d" " -f4)    
    propName=$(basename "${prop%.*}")

    # Replace spaces and dashes with underscores
    name=${propName// /_}
    name=${name//-/_}

    # Convert to snake case for dart
    name=$(echo "$name" | perl -nE 'say lcfirst join "", map {ucfirst lc} split /[^[:alnum:]]+/')

    echo "  static final $name = Asset("
    echo "    name: '$propName',"
    echo "    path: '$prop',"
    echo "    size: const Size($width, $height),"
    echo "  );"
done

echo "}"

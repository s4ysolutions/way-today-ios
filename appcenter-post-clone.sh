#!/usr/bin/env bash
pwd
echo $APPCENTER_SOURCE_DIRECTORY
ls -l

cat > "$APPCENTER_SOURCE_DIRECTORY/Way.Today/wsse/secret.swift" <<EOT
import Foundation

class GRPCSecret {
  static let secret = "$SECRET"
}
EOT

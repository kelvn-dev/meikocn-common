#!/bin/bash

VERSION=$1

if [[ -z "$VERSION" ]]; then
  echo "❌ Usage: ./release.sh v1.2.3"
  exit 1
fi

echo "🏷️  Tagging $VERSION..."
git tag "$VERSION"
git push origin "$VERSION"

echo "🚀 Creating GitHub release..."
gh release create "$VERSION" \
  --title "Release $VERSION" \
  --notes "🔖 Automated release for version $VERSION"

echo "✅ Done: GitHub release published and CI/CD triggered."

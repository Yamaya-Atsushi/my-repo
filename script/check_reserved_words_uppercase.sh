#!/bin/bash
set -e

# チェック対象のSQL予約語（必要に応じて追加）
RESERVED_WORDS=("select" "from" "where" "insert" "update" "delete" "join" "inner" "left" "right" "on" "as" "group" "by" "order" "limit" "offset")

# チェック対象のSQLファイルをすべて取得
FILES=$(find . -type f -name "*.sql")

has_error=0

for file in $FILES; do
  for word in "${RESERVED_WORDS[@]}"; do
    # 小文字で書かれた予約語があればエラー出力
    if grep -Enw "\b${word}\b" "$file"; then
      echo "::error file=$file::Reserved word '${word}' should be uppercase."
      has_error=1
    fi
  done
done

exit $has_error

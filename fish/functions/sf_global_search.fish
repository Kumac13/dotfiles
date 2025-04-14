function sf_global_search
    if test -z "$argv[1]"
        echo "Error: 検索クエリが指定されていません"
        echo "使用法: sf_global_search \"検索キーワード\""
        return 1
    end

    if not set -q SF_DOMAIN
        echo "Error: 環境変数 SF_DOMAIN が設定されていません"
        echo "設定例: set -gx SF_DOMAIN \"freee\""
        return 1
    end

    set search_query $argv[1]
    set org_url "https://$SF_DOMAIN.lightning.force.com"

    # Salesforceが期待する形式にエンコードする文字列を作成
    set string_to_encode '{"componentDef":"forceSearch:search","attributes":{"term":"'$search_query'","scopeMap":{},"context":{"disableSpellCorrection":false,"SEARCH_ACTIVITY":{"term":"'$search_query'"}}}}'

    # Base64エンコーディング
    set encoded_string (echo -n $string_to_encode | base64)

    # URLを組み立てて開く
    set search_url "$org_url/one/one.app?source=alohaHeader#$encoded_string"

    echo "Opening search URL for query: $search_query in $SF_DOMAIN org"
    open $search_url
end

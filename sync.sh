tmp=$(mktemp -d)

git clone https://github.com/ScoopInstaller/Main $tmp/main -b master --depth 1
git clone https://github.com/lukesampson/scoop-extras $tmp/extras -b master --depth 1
git clone https://github.com/kidonng/sushi $tmp/sushi -b master --depth 1

cp $tmp/main/bucket/{naiveproxy,trojan,v2ray,xray}.json bucket/
cp $tmp/extras/bucket/qv2ray.json bucket/
cp $tmp/sushi/bucket/{qv2ray-plugin-command,qv2ray-plugin-naiveproxy,qv2ray-plugin-ss,qv2ray-plugin-ssr,qv2ray-plugin-trojan-go,qv2ray-plugin-trojan,trojan-go,v2ray-domain-list-community,v2ray-geoip,v2ray-rules-dat}.json bucket/

sed -E -i 's/github\.com\/(.+)\/releases\/download/download.fastgit.org\/\1\/releases\/download/' bucket/*
sed -E -i 's/sushi\//mochi\//' bucket/*
sed -E -i 's/"extras\/qv2ray"/"mochi\/qv2ray"/' bucket/*
sed -E -i 's/"v2ray",/"mochi\/v2ray",/' bucket/*
sed -E -i 's/"naiveproxy"/"mochi\/naiveproxy"/' bucket/*

# https://stackoverflow.com/a/25149786
if [[ $(git status --porcelain --untracked-files=no) ]]; then
  git add -u
  git config user.name "github-actions[bot]"
  git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
  git commit -m "Sync"
  git push
fi

rm -rf $tmp

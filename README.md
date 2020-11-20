# 🍡 Mochi

The official [Scoop](https://scoop.sh/) bucket for [Qv2ray](https://qv2ray.net/) applications and plugins, along with their dependencies. Optimized for Mainland China users via [FastGit](https://fastgit.org/).

## Usage

```powershell
scoop bucket add mochi https://hub.fastgit.org/Qv2ray/mochi
# Do not forget to prefix with the bucket name!
scoop install mochi/qv2ray mochi/v2ray
```

If Scoop isn't installed yet, you can install it with:

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb 'https://raw.fastgit.org/kidonng/Install/fastgit/install.ps1' | iex
```

Also checkout [`sushi`](https://github.com/kidonng/sushi) which provides additional resources that do not suit in this bucket.

## License

[GPL-3.0](LICENSE)

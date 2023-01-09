$distroName = "dev-ubuntu"
$userName = "dev-user"

pushd $env:LOCALAPPDATA/Packages
mkdir -Force $distroName

$url = "https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64-wsl.rootfs.tar.gz"
$uri = New-Object System.Uri($url)
$imageFileName = Split-Path $uri.AbsolutePath -Leaf
$imageFilePath = (Join-Path -Path $env:LOCALAPPDATA/Packages/$distroName -ChildPath $imageFileName)

if(-Not(Test-Path $imageFilePath)) {
  Invoke-WebRequest -Uri $url `
                    -OutFile $imageFilePath
}


wsl --import $distroName .\ $imageFilePath

wsl -d $distroName -e /bin/bash -c "adduser --disabled-password --gecos '' ${userName}"
wsl -d $distroName -e /bin/bash -c "usermod -a -G sudo ${userName}"
wsl -d $distroName -e /bin/bash -c "echo ${userName}:${userName} | chpasswd"

popd

Copy-Item wsl.conf \\wsl$\$distroName\etc\wsl.conf
wsl -t $distroName

pause
## WSL2 Setting Playbook

### Setup
#### 開発専用のWSL2作成
  1. Powershellを開きます。
  1. `Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process` を実行します。
  1. `wsl/create-wsl-ubuntu20.04.ps1` をPowershellで実行します。
  1. `wsl -d dev-ubuntu` を実行し、wslに入ります。
  1. wsl内で下記のコマンドを実行します。
      ```
        $ git clone https://github.com/tamutamu/ansible-docker-wsl2.git
        $ cd ansible-docker-wsl2
        $ ./setup.sh
        $ ./ctl
        ```
  1. 一度wslからログアウトし、下記コマンドでdev-ubuntuを終了します。そして再度ログインすることで完了です。
     ```
     wsl -t dev-ubuntu
     wsl -d dev-ubuntu
     ```

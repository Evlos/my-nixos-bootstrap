default:
	nixos-install -vvv --option substituters "https://mirrors.cernet.edu.cn/nix-channels/store"
	nixos-enter --root '/mnt'
	passwd evlos

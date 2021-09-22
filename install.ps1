if (!(Get-Command "nvim" -errorAction SilentlyContinue)) {
	echo "Installing nvim with choco 'scoop install neovim'"
    scoop install neovim
}

#Install ripgrep
if (!(Get-Command "rg" -errorAction SilentlyContinue)) {
    scoop install ripgrep
}

#install fd
if (!(Get-Command "fd" -errorAction SilentlyContinue)) {
    scoop install fd
}

# Install Plug
echo "Installing plug"
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

# Make nvim folders
if (!(Test-Path "~\AppData\Local\nvim\plugin\") ){
	mkdir -p "~\AppData\Local\nvim\plugin\"
}
if (!(Test-Path "~\AppData\Local\nvim\after\plugin\") ){
	mkdir -p "~\AppData\Local\nvim\after\plugin\"
}
if (!(Test-Path "~\AppData\Local\nvim\lua\") ){
	mkdir -p "~\AppData\Local\nvim\lua\"
}

# enable dev mode for symbolic links
$RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
if(-not(Test-Path -Path $RegistryKeyPath)) {
	New-Item -Path $RegistryKeyPath -ItemType Directory -Force
	New-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1
}

# link wholesale
echo "Setting up .vim and .lua links"
foreach ($f in Get-ChildItem -Path . -Include *.lua,*.vim,*.json -Recurse -Force | % { $_ | Resolve-Path -Relative }) {
	$path = "~\AppData\Local\nvim\$f"
    if(Test-Path $path) {
    	rm $path
    }
	New-Item -ItemType SymbolicLink -Path $path -Target $pwd/$f
}

nvim --headless +PlugInstall +qall

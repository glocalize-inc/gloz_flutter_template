dir=$(pwd)
flutter pub get

packages=($(ls -d packages/*/))

for package in "${packages[@]}"

do
  echo "$package"
  cd "$dir/$package"
  echo "[$package] Installation"
  flutter pub get
done

cd $dir
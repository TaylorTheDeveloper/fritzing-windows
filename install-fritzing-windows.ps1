
$boostVersion = "1_74_0"
$boostZipFn = "boost_$boostVersion.zip"
$cmakeVersion = "3.18.2"
$cmakeMsiFn = "cmake-$cmakeVersion-win64-x64.msi"
$libgitVersion = "0.28.5"
$libGitFn ="libgit2-$libgitVersion.zip"


mkdir fritzing 
cd fritzing
git clone https://github.com/fritzing/fritzing-app
git clone https://github.com/fritzing/fritzing-parts
wget "https://dl.bintray.com/boostorg/release/1.74.0/source/$boostZipFn"
Expand-Archive -LiteralPath ".\$boostZipFn" -DestinationPath ".\" -Force
rm $boostZipFn
wget "https://github.com/Kitware/CMake/releases/download/v3.18.2/$cmakeMsiFn"

wget "https://github.com/libgit2/libgit2/releases/download/v0.28.5/$libgitFn"

cd ~/fritzing/libgit2
mkdir build
cd build
cmake -DBUILD_SHARED_LIBS=OFF ..
cmake --build .
declare TARGET_D="@cnto-additions"
declare SOURCE_D="."

rm -rf ${TARGET_D}

mkdir -p ${TARGET_D}
for file_name in $(find ${SOURCE_D}/ -mindepth 0 -maxdepth 1 -type f ! -name '.*' ! -name "build.sh")
do
  cp "${file_name}" ${TARGET_D}/
done

mkdir -p ${TARGET_D}/addons
for file_name in $(find ${SOURCE_D}/addons -mindepth 0 -maxdepth 1 -type f ! -name '.*')
do
  cp "${file_name}" ${TARGET_D}/addons
done

for dir_name in $(find ${SOURCE_D}/addons -mindepth 1 -maxdepth 1 -type d)
do
  declare BASE_DIR_NAME=$(basename "$dir_name")
  armake build -f -p "${dir_name}" "${TARGET_D}/addons/${BASE_DIR_NAME}.pbo"
done

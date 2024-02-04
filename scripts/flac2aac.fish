#!/usr/bin/env fish

set INPUT_DIR (path resolve ~/Music/Peti\'s\ Music\ Library)
set OUTPUT_DIR (path resolve ~/Music/Peti\'s\ AAC\ Archive)

mkdir -p $OUTPUT_DIR

for file in $INPUT_DIR/**/*.flac
  set relative_path (string replace "$INPUT_DIR/" "" $file)
  set output_file (path resolve "$OUTPUT_DIR/$relative_path" | path change-extension "m4a")

  if test -e $output_file
    echo "Skipping existing file: $output_file"
    continue
  end

  mkdir -p (path dirname $output_file)

  ffmpeg -i $file -c:a aac_at -b:a 128K -c:v mjpeg -filter:v scale=600x600 $output_file
end

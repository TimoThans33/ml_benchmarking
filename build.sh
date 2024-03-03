for file in $(find . -name "*.Dockerfile"); do
    docker build -f "$file" -t "$(basename "${file%.*}cm")" .
done
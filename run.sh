docker ps
read -p "Enter CONTAINER ID (Select from above. Enter if not available) : " psid
if [ ! -z "$psid" ]
then
    echo "Killing the process : $psid"
    docker container stop $psid
    docker rm $psid
fi
read -p "Do you want to create new image and run [y/n] " flag
if [ 'y' == $flag ]
then
    echo "creating images"
    docker build -t mynginx_image2 .
    echo "Running images"
    docker run --name mynginx4 -p 80:80 -d mynginx_image2
fi

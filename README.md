Create NGINX image by running the command from the directory where the Dockerfile is located.
```
FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY content /usr/share/nginx/html
COPY conf /etc/nginx
```
The period (“.”) at the end of the command defines the current directory as the build context, which contains the Dockerfile and the directories to be copied:
## Create the new NGINX image by running the following command:
```
$ docker build -t mynginx_image2 .
```
## Create an NGINX container mynginx4 based on the mynginx_image2 image:
```
$ docker run --name mynginx4 -p 80:80 -d mynginx_image2
```
## Start a helper container mynginx4_files that has a shell, providing access the content and configuration directories of the mynginx4 container we just created:
```
$ docker run -i -t --volumes-from mynginx4 --name mynginx4_files debian /bin/bash
root@b1cbbad63dd1:/#
```
where:

the new mynginx4_files helper container runs in the foreground with a persistent standard input (the -i option) and a tty (the -t option). All volumes defined in mynginx4 are mounted as local directories in the helper container.
the debian argument means that the helper container uses the Debian image from Docker Hub. Because the NGINX image also uses Debian, it is most efficient to use Debian for the helper container, rather than having Docker load another operating system
the /bin/bash argument means that the bash shell runs in the helper container, presenting a shell prompt that you can use to modify files as needed

## To start and stop the container, run the commands:
```
$ docker start mynginx4_files
$ docker stop mynginx4_files
```
To exit the shell but leave the container running, press Ctrl+p followed by Ctrl+q. To regain shell access to a running container, run this command:
```
$ docker attach mynginx4_files
```

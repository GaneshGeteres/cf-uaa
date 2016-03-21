#Build image
docker build -t roothema/uaa:3.2.1

#Run 
docker run -d --name rootuaa -p 8080:8080 roothema/uaa:3.2.1

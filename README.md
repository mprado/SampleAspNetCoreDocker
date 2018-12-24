# Exemplo de um prjeto ASP.NET Core 2.1 rodando em um container Docker 
Sample ASP.NET Core 2.1 running in Docker container.

### Build e criação da imagem:
docker build -t sample-aspnetcore-docker .

### Criando o container Docker a partir da imagem
docker run -d -p 5000:80 sample-aspnetcore-docker
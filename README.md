# SampleAspNetCoreDocker
Sample ASP.NET Core 2.1 running in Docker container.


Generate Docker Image:
docker build -t sample-aspnetcore-docker .

Create Docker Container From Image:
docker run -d -p 5000:80 sample-aspnetcore-docker
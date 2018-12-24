# SampleAspNetCoreDocker
Sample ASP.NET Core 2.1 running in Docker container.


docker build -t sample-aspnetcore-docker .

docker run -d -p 5000:80 sample-aspnetcore-docker
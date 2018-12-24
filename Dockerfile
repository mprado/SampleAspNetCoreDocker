FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["SampleAspNetCoreDocker.Api/SampleAspNetCoreDocker.Api.csproj", "SampleAspNetCoreDocker.Api/"]
RUN dotnet restore "SampleAspNetCoreDocker.Api/SampleAspNetCoreDocker.Api.csproj"
COPY . .
WORKDIR "/src/SampleAspNetCoreDocker.Api"
RUN dotnet build "SampleAspNetCoreDocker.Api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "SampleAspNetCoreDocker.Api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "SampleAspNetCoreDocker.Api.dll"]

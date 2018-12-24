FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 3000

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["src/FirstAspNetCoreDocker.Api/FirstAspNetCoreDocker.Api.csproj", "src/FirstAspNetCoreDocker.Api/"]
RUN dotnet restore "src/FirstAspNetCoreDocker.Api/FirstAspNetCoreDocker.Api.csproj"
COPY . .
WORKDIR "/src/src/FirstAspNetCoreDocker.Api"
RUN dotnet build "FirstAspNetCoreDocker.Api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "FirstAspNetCoreDocker.Api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "FirstAspNetCoreDocker.Api.dll"]

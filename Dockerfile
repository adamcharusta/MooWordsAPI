FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG CONFIGURATION=Release
WORKDIR /src

COPY Directory.Build.props .
COPY Directory.Packages.props .
COPY MooWordsAPI.sln .
COPY Src/Application/Application.csproj Src/Application/
COPY Src/Domain/Domain.csproj Src/Domain/
COPY Src/Infrastructure/Infrastructure.csproj Src/Infrastructure/
COPY Src/Web/Web.csproj Src/Web/

RUN dotnet restore Src/Web/Web.csproj

COPY . .

RUN dotnet publish Src/Web/Web.csproj -c $CONFIGURATION -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+:80
ENV ASPNETCORE_ENVIRONMENT=Production

EXPOSE 80

ENTRYPOINT ["dotnet", "MooWordsAPI.Web.dll"]
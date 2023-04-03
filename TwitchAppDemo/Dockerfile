FROM mcr.microsoft.com/dotnet/sdk:7.0 AS Build

WORKDIR /app
COPY . .

RUN dotnet restore

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0
EXPOSE 80
EXPOSE 443
WORKDIR /app
COPY --from=Build /app/out .
ENTRYPOINT [ "dotnet", "TwitchAppDemo.dll" ]
# ⚙️ Build Stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# ✅ COPY แค่ .csproj ก่อน เพื่อให้ cache dotnet restore ได้
COPY WebApiProject.csproj ./

# ✅ แสดงชัดเจนว่ากำลัง restore
RUN echo ">> RUNNING DOTNET RESTORE..." && \
    dotnet restore --verbosity normal

# ✅ COPY ไฟล์อื่น ๆ ภายหลัง
COPY . .

# ✅ Build
RUN dotnet publish -c Release -o /app/out

# 🐳 Runtime Stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./

ENTRYPOINT ["dotnet", "WebApiProject.dll"]

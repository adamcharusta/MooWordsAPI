using MooWordsAPI.Infrastructure;
using MooWordsAPI.Web;
using Serilog;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .CreateLogger();

try
{
    var builder = WebApplication.CreateBuilder(args);

    builder.Services
        .AddInfrastructureServices(builder.Configuration)
        .AddApplicationServices()
        .AddWebServices();

    var app = builder.Build();

    app.UseWebServices();
    app.Run();
}
catch (Exception e)
{
    Log.Fatal(e, "Application start-up failed");
}
finally
{
    Log.CloseAndFlush();
}

public partial class Program;

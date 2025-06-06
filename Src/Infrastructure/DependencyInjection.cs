using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace MooWordsAPI.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructureServices(this IServiceCollection services,
        IConfigurationManager config)
    {
        return services;
    }
}

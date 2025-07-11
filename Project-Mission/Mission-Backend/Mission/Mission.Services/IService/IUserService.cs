using Mission.Entities.ViewModels;
using Mission.Entities.ViewModels.Login;
using Mission.Services.IService;

namespace Mission.Services.IService
{
    public interface IUserService
    {
        Task<ResponseResult> LogiUser(UserLoginRequestModel model);
    }
}

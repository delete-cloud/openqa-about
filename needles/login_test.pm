package login_test;
use base "basetest";
use strict;
use testapi;

sub run {
    diag "Starting login test...";

    # 设置超时时间为1800秒 (30分钟)
    my $timeout = 1800;

    # 等待系统启动完成，可以通过检测某个特定的启动标志来实现
    # 例如，等待出现登录界面
    diag "Waiting for login screen to appear";
    assert_screen 'login', timeout => $timeout;

    # # 匹配用户名下拉菜单
    # diag "Clicking on user menu";
    # assert_and_click 'user-menu', timeout => $timeout;

    # # 选择 "Other..." 选项
    # diag "Clicking on other option";
    # assert_and_click 'other-click', timeout => $timeout;

    # # 输入用户名 root
    # diag "Entering username root";
    # assert_and_click 'username-input', timeout => $timeout;
    # type_string 'root';

    # 输入密码
    diag "Entering password";
    assert_and_click 'password-input', timeout => $timeout;
    type_string 'openEuler12#$';

    # 点击 "Log in" 按钮
    diag "Clicking login button";
    assert_and_click 'login-click', timeout => $timeout;

    # 确认进入桌面
    diag "Checking if desktop is shown";
    assert_screen 'desktop', timeout => $timeout;

    diag "Login test completed.";
}

1;

package gedit_test;
use base "basetest";
use strict;
use testapi;

sub run {
    diag "Starting gedit test...";

    # 设置超时时间为1200秒 (20分钟)
    my $timeout = 1200;

    # 等待系统启动完成，可以通过检测某个特定的启动标志来实现
    # 例如，等待出现登录界面
    diag "Waiting for login screen to appear";
    assert_screen 'login', $timeout;

    # 输入密码
    diag "Entering password";
    type_string 'openEuler12#$', timeout => $timeout;
    assert_screen 'password-input', timeout => $timeout;

    # 发送 Enter 键以登录
    diag "Sending Enter key to login";
    send_key 'ret', timeout => $timeout;

    # 添加额外的等待时间，确保桌面完全加载
    diag "Waiting for the desktop to load completely";
    wait_still_screen stilltime => 60, timeout => 60;  # 设置stilltime和timeout为60秒 (1分钟)

    # 确认进入桌面，匹配 gedit 图标
    diag "Checking if gedit icon is shown";
    assert_and_click 'gedit-icon', $timeout;

    diag "Send Enter key to open gedit";
    send_key 'ret', timeout => $timeout;

    diag "Checking if gedit is opened";
    assert_screen 'open-button', $timeout;

    diag "Typing text";
    type_string 'Hello openEuler', timeout => $timeout;
    
    diag "Checking if text is matched"
    assert_screen 'text-input-match', $timeout;

    diag "Trying to "

    diag "Gedit test completed.";
}

1;

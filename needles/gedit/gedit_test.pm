package gedit_test;
use base "basetest";
use strict;
use testapi;

sub run {
    diag "Starting gedit test...";

    # 设置超时时间为180秒 (3分钟)
    my $timeout = 180;

    # 等待系统启动完成，可以通过检测某个特定的启动标志来实现
    # 例如，等待出现登录界面
    diag "Waiting for login screen to appear";
    assert_screen 'username-match', timeout => $timeout;

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
    assert_and_click 'gedit-icon', timeout => $timeout;

    # 发送 Enter 键以打开 gedit
    diag "Send Enter key to open gedit";
    send_key 'ret', timeout => $timeout;

    # 检测 gedit 是否打开
    diag "Checking if gedit is opened";
    assert_screen 'open-button', timeout => $timeout;

    # 输入文本
    diag "Typing text";
    type_string 'Hello openEuler', timeout => $timeout;
    
    # 检测文本输入是否匹配
    diag "Checking if text is matched";
    assert_screen 'text-input-match', timeout => $timeout;

    # 保存文件
    diag "Trying to save file to desktop";
    assert_and_click 'save-button-match', timeout => $timeout;

    # 匹配重命名输入栏
    assert_screen 'name-input', timeout => $timeout;
    type_string 'hello', timeout => $timeout; # 输入新文件名

    # 匹配检测重命名
    assert_screen 'rename-match', timeout => $timeout;

    # 点击 Desktop 保存位置
    assert_and_click 'desktop-folder-click', timeout => $timeout;

    # 匹配 Desktop 保存位置
    assert_screen 'save-position-match-1', timeout => $timeout;

    # 点击 Save 按钮
    assert_and_click 'save-button', timeout => $timeout;

    # 匹配 org 保存位置
    assert_screen 'save-position-match-2', timeout => $timeout;

    # 点击 Save 按钮
    assert_and_click 'save-button-click', timeout => $timeout;

    # 匹配保存文件后 gedit 界面的文件目录
    diag "Saving success";
    diag "Trying to match file path";
    assert_screen 'file-path-match', timeout => $timeout;

    diag "Closing the text file";
    assert_and_click 'close-button-match', timeout => $timeout;

    diag "Trying to match file in desktop";
    assert_screen 'hello-file-match', timeout => $timeout;

    diag "Gedit test completed.";
}

1;

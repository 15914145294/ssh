"""
A:
	1.远程连接到ssh服务器
	2.执行ssh-keygen 生成密码对 设置秘钥密码 在用户的/root/.ssh目录下回生成id_sra id_sra.pub两个文件
B:
	在服务器上安装公钥
	cd  /root/.ssh
	cat id_sra.pub >> authorized_keys
	# 设置权限
	chmod 600 authorized_keys
	cd ../
	chmod 700 .ssh
C: 设置SSH 打开登录功能
	cd /etc/ssh
	vi sshd_config
	RSAAuthentication yes
	PubkeyAuthentication yes

	# 另外，请留意 root 用户能否通过 SSH 登录，默认为yes：
	PermitRootLogin yes

	当我们完成全部设置并以密钥方式登录成功后，可以禁用密码登录。
	# 禁用密码登录
	PasswordAuthentication no

	
D: service sshd restart #最后，重启 SSH 服务

E：将/root/.ssh/id_sra.pub下载到客户端 
F: securecrt快速登录模式下 录入ip username 选择刚下载的id_sra.pub 录入秘钥密码 即可实现security秘钥登录

"""

% 输入数据 (4个样本, 每个样本有2个输入)
inputs = [0 0 1 1; 0 1 0 1];

% 目标输出 (对应的XOR结果)
targets = [0 1 1 0];

% 创建一个有1个隐藏层、隐层有2个神经元的前馈神经网络
net = feedforwardnet(2);

% 设置训练参数（可以调整以改进训练）
net.trainParam.epochs = 1000; % 最大训练次数
net.trainParam.goal = 1e-6;   % 目标误差

% 训练神经网络
net = train(net, inputs, targets);

% 测试神经网络
outputs = net(inputs);

% 显示结果
disp('Predicted Outputs:');
disp(outputs);

disp('Target Outputs:');
disp(targets);

% 将输出四舍五入到0或1
rounded_outputs = round(outputs);

disp('Rounded Outputs (Binary Classification):');
disp(rounded_outputs);

%查看训练的网络
view(net);
# Difference between rl and drl

https://stackoverflow.com/questions/37973108/what-is-the-difference-between-reinforcement-learning-and-deep-rl

深度强化学习是在强化学习的基础上利用神经网络拟合 q 值

# Off-policy vs On-policy

https://analyticsindiamag.com/reinforcement-learning-policy/

- off-policy Behaviour policy ≠ Policy used for action selection 不直接更新行为策略，而是通过回报和贪婪算法变相的获得行为策略，例如 q-learning, dqn, ddqn, ddpg，其 act 由随机值和 epsilon 决定
- on-policy Behaviour policy == Policy used for action selection 直接更新行为策略，act 和评估策略是一致的，例如 sarsa, ppo, trpo
- offline rl No Behaviour policy 利用离线数据（例如随机行为产生的数据）训练策略，与监督学习类似

import 'package:flutter/material.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  // 个人信息
  Widget _buildUserInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 30)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 30)),
      ],
    );
  }

  // 表头
  Widget _buildTableHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          '项目',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        const Text(
          '成绩',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        const Text(
          '得分',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        const Text(
          '评价',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        const Text(
          '违规',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
      ],
    );
  }

  // 表行
  Widget _buildTableRow(
    String project,
    String score,
    String points,
    String evaluation,
    String violation,
  ) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            project,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            score,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            points,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            evaluation,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          Text(
            violation,
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.greenAccent, size: 28),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 180), // 设置最大高度
            child: SingleChildScrollView(
              child: Text(
                content,
                style: const TextStyle(color: Colors.white, fontSize: 18),
                maxLines: null, // 允许无限行
                overflow: TextOverflow.visible, // 不截断，允许滚动
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 个人信息
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/profile.jpg",
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'XXX',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
                const SizedBox(height: 12),
                _buildUserInfoRow('班级', '一年2班'),
                SizedBox(height: 10),
                _buildUserInfoRow('性别', '男'),
                SizedBox(height: 10),
                _buildUserInfoRow('学号', '20160256'),
              ],
            ),
          ),
        ),
        // 成绩表
        Expanded(
          flex: 3,
          child: Column(
            children: [
              // 项目
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xff060790),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildTableHeader(),
                    _buildTableRow('立定跳远', '--厘米', '0分', '待提高', '无违规'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              //点评
              Container(
                height: 310,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xff1819CE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildCard(
                        title: '锻炼点评',
                        icon: Icons.check_circle,
                        content: '该生立定跳远运动技能掌握不足，各项技术动作和四肢肌肉力量均具有较大提升空间。',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: _buildCard(
                        title: '运动参数',
                        icon: Icons.data_usage,
                        content: '''
摆臂次数     0次
预摆角度     --
起跳角度     --
腾空时间     --秒
落地角度     --
膝关节角度   --
                      ''',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: _buildCard(
                        title: '锻炼建议',
                        icon: Icons.lightbulb_outline,
                        content: '''
上肢：强化摆臂与蹬地的协调性，摆臂幅度直接影响腾空高度，建议进行俯卧撑和负重摆臂练习。
下肢：建议增加深蹲、半蹲跳、弓箭步蹲等动作训练，能有效增强臀腿力量
''',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

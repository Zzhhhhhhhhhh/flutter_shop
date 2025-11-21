import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpLearning extends StatefulWidget {
  const HttpLearning({super.key});

  @override
  State<HttpLearning> createState() => _HttpLearningState();
}

class _HttpLearningState extends State<HttpLearning> {
  List<Channel> channels = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchChannels();
  }

  Future<void> _fetchChannels() async {
    try {
      final response = await Dio().get(
        "https://geek.itheima.net/v1_0/channels",
      );

      if (response.statusCode == 200) {
        final channelResponse = ChannelResponse.fromJson(response.data);
        setState(() {
          channels = channelResponse.data.channels;
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = '请求失败: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = '网络请求错误: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('频道列表'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchChannels,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('加载中...'),
          ],
        ),
      );
    }

    if (errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('错误: $errorMessage', textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _fetchChannels, child: const Text('重试')),
          ],
        ),
      );
    }

    if (channels.isEmpty) {
      return const Center(child: Text('暂无数据'));
    }

    return ListView.builder(
      itemCount: channels.length,
      itemBuilder: (context, index) {
        final channel = channels[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                channel.id.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              channel.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // 点击事件处理
              _showChannelDetail(channel);
            },
          ),
        );
      },
    );
  }

  void _showChannelDetail(Channel channel) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(channel.name),
        content: Text('频道ID: ${channel.id}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }
}

// 数据模型类
class ChannelResponse {
  final String message;
  final Data data;

  ChannelResponse({required this.message, required this.data});

  factory ChannelResponse.fromJson(Map<String, dynamic> json) {
    return ChannelResponse(
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final List<Channel> channels;

  Data({required this.channels});

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['channels'] as List;
    List<Channel> channelsList = list.map((i) => Channel.fromJson(i)).toList();
    return Data(channels: channelsList);
  }
}

class Channel {
  final int id;
  final String name;

  Channel({required this.id, required this.name});

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(id: json['id'], name: json['name']);
  }
}

import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

// ማሳሰቢያ፡ "ያንተን_App_ID_እዚህ_ጋር_አስገባ" በሚለው ቦታ ላይ የአጎራ ቁጥርህን በደንብ ተካው
const String appId = "ያንተን_App_ID_እዚህ_ጋር_አስገባ"; 

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnduLiveRoom(),
    ));

class EnduLiveRoom extends StatefulWidget {
  @override
  _EnduLiveRoomState createState() => _EnduLiveRoomState();
}

class _EnduLiveRoomState extends State<EnduLiveRoom> {
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    setupVoice();
  }

  Future<void> setupVoice() async {
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(appId: appId));
    await _engine.enableAudio();
    await _engine.setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);
    await _engine.setClientRole(ClientRoleType.clientRoleBroadcaster);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0C29), // የክፍሉ ዳራ ቀለም
      appBar: AppBar(
        title: Text("ኤንዱ ላይቭ - የፓርቲ ክፍል", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // የ30 ሰው መቀመጫዎች
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, 
                mainAxisSpacing: 12, 
                crossAxisSpacing: 12,
              ),
              itemCount: 30, // አንተ የፈለግከው 30 መቀመጫ
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 24, 
                      backgroundColor: Colors.white12, 
                      child: Icon(Icons.mic_none, color: Colors.white54, size: 20)
                    ),
                    SizedBox(height: 4),
                    Text("መቀመጫ ${index + 1}", style: TextStyle(color: Colors.white70, fontSize: 9)),
                  ],
                );
              },
            ),
          ),
          
          // የታችኛው የመቆጣጠሪያ ባር
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [Icon(Icons.chat_bubble_outline, color: Colors.white), Text("መልዕክት", style: TextStyle(color: Colors.white, fontSize: 10))]),
                
                // የስጦታ (Gift) ቁልፍ
                GestureDetector(
                  child: Column(children: [Icon(Icons.card_giftcard, color: Colors.pinkAccent, size: 40), Text("ስጦታ", style: TextStyle(color: Colors.white, fontSize: 10))]),
                ),
                
                Column(children: [Icon(Icons.mic, color: Colors.cyanAccent, size: 30), Text("ማይክ", style: TextStyle(color: Colors.white, fontSize: 10))]),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omurice/pages/top_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await dotenv.load();
  Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_KEY'] ?? '',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthPage(
          // title: 'Flutter Demo Home Page',
          ),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  User? _user;
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  void initState() {
    _getAuth();
    super.initState();
  }

  Future<void> _getAuth() async {
    setState(
      () {
        _user = supabase.auth.currentUser;
      },
    );
    supabase.auth.onAuthStateChange.listen(
      (event) {
        setState(
          () {
            _user = event.session?.user;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _user == null ? const StartPage() : const MyHomePage(title: "ログイン済");
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final SupabaseClient supabase = Supabase.instance.client;
  bool _signInLoading = false;
  bool _signUpLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 150, child: Image.asset('images/icon.png')),
                  const SizedBox(height: 25),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is required';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: const InputDecoration(label: Text("Email")),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is required';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    decoration: const InputDecoration(label: Text("Password")),
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),
                  _signInLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            final isValid = _formKey.currentState?.validate();
                            if (isValid != true) {
                              return;
                            }
                            setState(() {
                              _signInLoading = true;
                            });
                            try {
                              await supabase.auth.signInWithPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Sign in Failed"),
                                backgroundColor: Colors.redAccent,
                              ));
                              setState(() {
                                _signInLoading = false;
                              });
                            }
                          },
                          child: const Text("Sign In"),
                        ),
                  _signUpLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : OutlinedButton(
                          onPressed: () async {
                            final isValid = _formKey.currentState?.validate();
                            if (isValid != true) {
                              return;
                            }
                            setState(() {
                              _signUpLoading = true;
                            });
                            try {
                              await supabase.auth.signUp(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Success ! Confirmation email sent"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              setState(() {
                                _signUpLoading = false;
                              });
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Sign up Failed"),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                              setState(
                                () {
                                  _signUpLoading = false;
                                },
                              );
                            }
                          },
                          child: const Text("Sign up"),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SupabaseClient supabase = Supabase.instance.client;
  late BannerAd _bannerAd;

  // TODO: privateなenvファイルに広告のIDの環境変数を実装する
  // final String adUnitId = kReleaseMode
  //     ? dotenv.env['RELEASE_AD_UNIT_ID']!
  //     : dotenv.env['DEV_AD_UNIT_ID']!;
  final String adUnitId = 'ca-app-pub-3940256099942544/2934735716';
  // androidのテスト用のID
  // ca-app-pub-3940256099942544/6300978111

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('バナー広告がロードされました。');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('バナー広告のロードに失敗しました: $error');
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () async {
              supabase.auth.signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const TopScreen(),
      bottomSheet: // バナー広告を表示するためのウィジェット
          Container(
            height: _bannerAd.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd),
          ),
    );
  }
}

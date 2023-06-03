<!DOCTYPE html>
<!-- saved from url=(0037)# -->
<html lang="en"><head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{env('APP_NAME')}} </title>

    <link rel="shortcut icon" href="#favicon.ico">

    <link rel="stylesheet" href="{{asset_url('css/roboto_base64.css')}}">
    <link rel="stylesheet" href="{{asset_url('css/montserrat_base64.css')}}">
    <link rel="stylesheet" href="{{asset_url('css/uikit.css')}}">
    <link rel="stylesheet" href="{{asset_url('css/style.css')}}">


    <script src="{{asset_url('js/uikit.js')}}"></script>
    <script src="{{asset_url('js/jquery.js')}}"></script>
    <script src="{{asset_url('js/jquery-migrate-1.2.1.min.js')}}"></script>
    <script src="{{asset_url('js/global.js')}}"></script>
    <script src="{{asset_url('js/scripts.js')}}"></script>
    <script src="{{asset_url('js/sweetalert2@9.js')}}"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.5.9/dist/js/uikit-icons.min.js"></script>
    @yield('styles')
    @yield('header')
    <style>
        input.uk-input { padding: initial !important;}
        .input-error { color: #db2d2d  }
        .spiner { display: none}
        .sc-list-icon svg > path {
            fill: #8a8a8a;
        }
        .black-btn {
             background: #37474f;color: #ffcc6e;
         }
         img { width: auto}
    </style>
</head>
<body>
<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
    {{ csrf_field() }}
</form>
<header id="sc-header">
    <div class="uk-container">
        <div class="uk-flex uk-flex-middle">
            <div class="uk-flex-1">
                <div class="sc-logo-wrapper">
                    <a href="{{url('/')}}"><img src="{{asset_url('img/logo_alt.png')}}" alt=""></a>
                     <svg width="350" height="190" id="trans" viewBox="0 0 400 200" xmlns="http://www.w3.org/2000/svg">
                        <g transform="translate(195,-90)">
                            <path d="M57.8,-54.7C83.9,-47,120.2,-37.3,151.7,-5.1C183.2,27.1,209.8,81.8,194.3,115.5C178.8,149.3,121.2,162,65.7,183.6C10.1,205.2,-43.3,235.5,-73.4,217.7C-103.5,199.8,-110.2,133.6,-126.4,83.6C-142.6,33.6,-168.3,-0.3,-175.9,-43.9C-183.5,-87.4,-173.1,-140.6,-140.8,-147.2C-108.4,-153.9,-54.2,-113.9,-19.2,-91.1C15.9,-68.2,31.7,-62.5,57.8,-54.7Z" fill="#abb8c3"></path>
                        </g>
                    </svg>
                </div>
            </div>
            <div class="uk-flex uk-flex-middle uk-visible@m">
                <ul class="sc-menu">
                    <li><a href="#sect-technologies" data-uk-scroll="">Technologies</a></li>
                    <li><a href="#sect-about-us" data-uk-scroll="">About Us</a></li>
                    <li><a href="/services" >services</a></li>
                    <li><a href="#sect-contact" data-uk-scroll="">Contact</a></li>
                </ul>
                <div class="uk-margin-left">
                    @if(Auth::user())


                        <button class="sc-button sc-button-small black-btn" type="button">{{Auth::user()->token}}</button>
                        <div uk-dropdown>
                            <ul class="uk-nav uk-dropdown-nav">
                                <li><a href="{{route('dashboard.index')}}" >Dashboard</a></li>
                                <li><a href="/third-party-login" >DR.Trader</a></li>
                                <li> <a href="{{route('dashboard.invest.index')}}"  >invest to ISB</a></li>
                                <li> <a href="{{route('dashboard.commission')}}"  >Commissions</a></li>
                                <li> <a href="{{route('dashboard.wallet')}}"  >My Wallet's</a></li>
                                <li> <a href="{{route('dashboard.deposit')}}"  >Deposit</a></li>
                                <li> <a href="{{route('dashboard.withdraw')}}"  >Withdraw</a></li>
                                <li> <a href="{{route('dashboard.wallet.point.create')}}"  >Convert Credits to Points</a></li>
                                <li class="uk-nav-divider"></li>
                                <li><a href="#" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"  >LOGOUT</a></li>
                            </ul>
                        </div>


                    @else
                        <a  href="{{url('/login')}}" class="sc-button sc-button-small black-btn" >Log In</a>
                        <a  href="{{url('/register')}}" class="sc-button sc-button-small black-btn" >Sign Up</a>
                    @endif
                </div>
{{--                uk-toggle="target: #auth-modal"--}}
            </div>
            <div class="uk-hidden@m">
                <a href="#" data-uk-toggle="target: #sc-nav-mobile" class="sc-offcanvas-toggle">
                    <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                        <path d="M3,6H21V8H3V6M3,11H21V13H3V11M3,16H21V18H3V16Z"></path>
                    </svg>
                </a>
            </div>
        </div>
    </div>
</header>

<div id="sc-nav-mobile" class="uk-hidden@m uk-offcanvas" data-uk-offcanvas="flip: true">
    <div class="uk-offcanvas-bar">
        <button type="button" class="uk-offcanvas-close uk-position-absolute uk-position-top-right uk-icon uk-close" data-uk-close=""><svg width= 0 height="14" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" data-svg="close-icon"><line fill="none" stroke="#000" stroke-width="1.1" x1="1" y1="1" x2="13" y2="13"></line></svg></button>

        <ul class="uk-nav">


        @if(Auth::user())

            <li><a href="{{route('dashboard.index')}}" class="sc-js-scroll-trigger">Dashboard</a></li>
            	<li>  <a href="/third-party-login"  >DR.Trader</a></li>
                <li> <a href="{{route('dashboard.invest.index')}}"  >invest to ISB</a></li>
                <li>  <a href="{{route('dashboard.commission')}}"  >Commissions</a></li>
                <li>  <a href="{{route('dashboard.deposit')}}"  >Deposit</a></li>
                <li>  <a href="{{route('dashboard.wallet')}}"  >My Wallet</a></li>
                <li> <a href="{{route('dashboard.withdraw')}}"  >Withdraw</a></li>
                <li> <a href="{{route('dashboard.wallet.point.create')}}"  >Convert Credits to Points</a></li>
                <li class="uk-nav-divider"><hr /></li>

                <li><a href="#" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();" class="uk-button uk-button-danger">Sign out</a></li>


        @else
            <li><a  href="{{url('/login')}}" class="sc-js-scroll-trigger" style="color: gray">sign In</a></li>
            <li><a  href="{{url('/register')}}" class="sc-js-scroll-trigger"  style="color: gray">sign Up</a></li>
        @endif
        </ul>

    </div>
</div>

<div style="min-height: 67vh">

@yield('main')
</div>
<footer id="sc-footer">
    <div class="uk-container">
        <div class="uk-flex-middle uk-grid uk-grid-small" data-uk-grid="">
            <div class="uk-flex-1 uk-first-column">
                Copyright © 2018 Networkchains
            </div>
            <div class="uk-flex uk-flex-middle uk-width-auto@m">
					<span class="uk-margin-small-right">
						Folow Us on
					</span>
                <a href="#" class="uk-margin-small-right">
                    <svg style="width:32px;height:32px" viewBox="0 0 24 24">
                        <path fill="#fff" d="M5,3H19A2,2 0 0,1 21,5V19A2,2 0 0,1 19,21H5A2,2 0 0,1 3,19V5A2,2 0 0,1 5,3M18,5H15.5A3.5,3.5 0 0,0 12,8.5V11H10V14H12V21H15V14H18V11H15V9A1,1 0 0,1 16,8H18V5Z"></path>
                    </svg>
                </a>
                <a href="#" class="uk-margin-small-right">
                    <svg style="width:32px;height:32px" viewBox="0 0 24 24">
                        <path fill="#fff" d="M7.8,2H16.2C19.4,2 22,4.6 22,7.8V16.2A5.8,5.8 0 0,1 16.2,22H7.8C4.6,22 2,19.4 2,16.2V7.8A5.8,5.8 0 0,1 7.8,2M7.6,4A3.6,3.6 0 0,0 4,7.6V16.4C4,18.39 5.61,20 7.6,20H16.4A3.6,3.6 0 0,0 20,16.4V7.6C20,5.61 18.39,4 16.4,4H7.6M17.25,5.5A1.25,1.25 0 0,1 18.5,6.75A1.25,1.25 0 0,1 17.25,8A1.25,1.25 0 0,1 16,6.75A1.25,1.25 0 0,1 17.25,5.5M12,7A5,5 0 0,1 17,12A5,5 0 0,1 12,17A5,5 0 0,1 7,12A5,5 0 0,1 12,7M12,9A3,3 0 0,0 9,12A3,3 0 0,0 12,15A3,3 0 0,0 15,12A3,3 0 0,0 12,9Z"></path>
                    </svg>
                </a>
                <a href="#">
                    <svg style="width:32px;height:32px" viewBox="0 0 24 24">
                        <path fill="#fff" d="M22.46,6C21.69,6.35 20.86,6.58 20,6.69C20.88,6.16 21.56,5.32 21.88,4.31C21.05,4.81 20.13,5.16 19.16,5.36C18.37,4.5 17.26,4 16,4C13.65,4 11.73,5.92 11.73,8.29C11.73,8.63 11.77,8.96 11.84,9.27C8.28,9.09 5.11,7.38 3,4.79C2.63,5.42 2.42,6.16 2.42,6.94C2.42,8.43 3.17,9.75 4.33,10.5C3.62,10.5 2.96,10.3 2.38,10C2.38,10 2.38,10 2.38,10.03C2.38,12.11 3.86,13.85 5.82,14.24C5.46,14.34 5.08,14.39 4.69,14.39C4.42,14.39 4.15,14.36 3.89,14.31C4.43,16 6,17.26 7.89,17.29C6.43,18.45 4.58,19.13 2.56,19.13C2.22,19.13 1.88,19.11 1.54,19.07C3.44,20.29 5.7,21 8.12,21C16,21 20.33,14.46 20.33,8.79C20.33,8.6 20.33,8.42 20.32,8.23C21.16,7.63 21.88,6.87 22.46,6Z"></path>
                    </svg>
                </a>
            </div>
        </div>
        <hr>
        <ul class="uk-list">
            <li><a href="#" onclick="alert('Your IP does not have permission to access this section')">Terms of Use</a></li>
            <li><a href="#" onclick="alert('Your IP does not have permission to access this section')">Privacy Policy</a></li>
            <li><a href="#" onclick="alert('Your IP does not have permission to access this section')">Cookie Settings</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#" onclick="alert('Your IP does not have permission to access this section')">Advertise with us</a></li>
            <li><a href="#" onclick="alert('Your IP does not have permission to access this section')">Newsletters</a></li>
            <li><a href="#" onclick="alert('Your IP does not have permission to access this section')">Sitemap</a></li>
        </ul>
    </div>
</footer>
{{------------------------- Animate Windows ----------------------------}}
<div id="whitepaper-window" class="uk-modal-page uk-overflow-auto" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-full uk-close-large" type="button" uk-close></button>
        <div  uk-height-viewport>

            <div class="uk-container uk-container-large uk-padding-large" style="background-image: url('{{asset('assets/img/readme/bg_2.jpg')}}'); background-size: cover">
                <h3>“Becoming data-driven has become a general goal for many companies”, says Mike Rollings, research vice president at Gartner. Today, many companies are still struggling to become data-driven. What exactly the company can do to become a “data-driven” company?

                    In this whitepaper you will learn:

                    The problems the company commonly faced
                    How to fix those problems
                    Next generation end-to-end data platform
                    Use case sharing</h3>
            </div>

        </div>
    </div>
</div>
<div id="Representatives" class="uk-modal-page uk-overflow-auto" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-full uk-close-large" type="button" uk-close></button>
        <div  uk-height-viewport>

            <div class="uk-container uk-container-large uk-padding-large" style="background-image: url('{{asset('assets/img/readme/bg_2.jpg')}}'); background-size: cover">
                <h3>Companies requesting an authorized representative to develop their business on our platform through the CRM panel </h3>
                <a href="https://www.nuskin.com/"target="_blank" class="uk-h2 sc-color-theme-dark">nu skin products</a>
                <h3>Nu skin, a large company with online stores in various fields of fashion and cosmetics, fashion, beauty and skin and hair care products, intends to market its products in an independent CRM platform and panel in the form of data, network advertising and marketing. Develop your business and develop your business.</h3>
                <a href="https://www.naturainternational.com/home"target="_blank" class="uk-h2 sc-color-theme-dark">Natura international</a>
                <h3>Natura International's television production and training company specializes in the production of essential products for the elimination of toxins and natural food supplements, and educates the public about body health and nutritional care globally, and seeks to expand its business into network marketing. And with the help of our experts to develop their business through our proprietary platforms.</h3>
                <a href="https://www.marykay.com/"target="_blank" class="uk-h2 sc-color-theme-dark">Mary Key Inc</a>
                <h3>Mary Kay was always ahead of her time. She changed the world of business by creating more opportunities for women, building a company driven by her values ​​and empowering women by controlling their future.
                    Marie Kay's goal is not just to sell cosmetics, she has not limited her business to that.
                    She believes that she wants to change the lifestyle for women over 50 to have a healthier life and a more natural and beautiful body.
                    Mary Kish started her business more than 50 years ago, but today she is still a source of inspiration to millions. Her values ​​continue in the company she has built, and her mission to empower women is as important now as it was in the past. Mary Kay's life has turned her into an interesting entrepreneur throughout her life, and her enduring legacy has made her a symbol.</h3>
                <a href="http://www.yofoto.net/"target="_blank" class="uk-h2 sc-color-theme-dark">Yofoto</a>
                <h3>YOFOTO Health Company (China) operates in the health industry. With the core value of self-esteem and respect for others, the vision of building the most prestigious family life brand and the most prestigious international company, YOFOTO integrates global resources and brings natural, healthy and high quality products to global families. By our actions, we explain our brand claim: the spark of natural life. YOFOTO strives to create values ​​for every stakeholder, such as YOFOTO employees, YOFOTO partners, customers, healthcare and nature. We are building a "social responsibility ecosystem" to achieve sustainable development between companies, communities and nature.
                    YOFOTO is also developing its business in the form of global network marketing of its business.</h3>
                <a href="https://en.ziranyixue.com"target="_blank" class="uk-h2 sc-color-theme-dark">en.ziranyixue</a>
                <h3>ziranyixue company offers different types of hotel and accommodation in its camps and villas, and by holding tours in the field of meditation and yoga, various herbal massages and relaxation of swimming pools, medical jacuzzis and medical springs, also in the form of network marketing. Develops worldwide with our help.</h3>
                <a href="https://www.tiens.com/en/#firstPage"target="_blank" class="uk-h2 sc-color-theme-dark">Tiens</a>
                <h3>Born in 1958, Mr. Li Jin Yuan is a Master of Science (MSc) graduate in EMBA from Nankai University School of Business. He is currently a Senior Economist, Chairman of Tiens Group, Tianjin Group of Tianshi and Tiens Life Science and Technology Research Institute, as well as President of Tiens Meijing International. His charity is also known as an entrepreneur, mentor, philanthropist and social activist.
                    TIENS Group has invested more than 7 billion RMB in the construction of TIENS International Industrial Park. The 1-square-kilometer park is a comprehensive industrial park that combines product research and development, pilot testing, manufacturing, healthcare, hotel and tourism, and conferences and exhibitions. This industrial park has provided TIENS Group with a stronger commercial platform and a wider space for development. Tianshi College, for which TIENS Group has invested more than RMB 10 billion, is the only comprehensive full-time private college offering undergraduate courses in Tianjin. With an area of ​​3.2 square kilometers and a total construction area of ​​2.1 million square meters, it can accommodate 42,600 students. It currently has 7 high schools, 31 undergraduate courses and 5 career programs with 7,008 students enrolled. At present, Tianshi College sets its own standards for well-known colleges abroad and strives to become a well-known private college within five years.</h3>
                <a href="https://rolmex.com.pl/"target="_blank" class="uk-h2 sc-color-theme-dark">rolmex</a>
                <h3>Rolmax manufactures tractor-cutting machines, arm mowers, for example arm mowers, stamp cutters, shoulder cutters, ditch cutters, guillotines for cutting bushes in ditches, branch saws. The wide range of offers is mainly addressed to companies that deal with the ongoing maintenance of roads in summer and winter. The leading product is a professional lawn mower and a special edition of road mower. Reliable lawn mowers and ultra-durable lawn mowers are maintained by more than 70% of Polish provincial and city road authorities throughout the year.</h3>
                <a href="http://www.modicare.com/"target="_blank" class="uk-h2 sc-color-theme-dark">modicare</a>
                <h3>Modicare is part of the Modi General Assembly, one of India's premier industrial complexes. Since its inception in 1996, Modicare has always believed in empowering people to decide their own destiny. The brand does this by providing the best products and all the support they need. Modicare provides an opportunity for everyone, regardless of race, color, gender or even education.
                    The Modicare website reflects the brand's efforts to place Modicare products and opportunities on the web. The Internet is perhaps the largest communication tool in the world today, and the brand aims to use interaction as well as spread the Modicare philosophy.</h3>
                <a href="https://www.appollobath.com/"target="_blank" class="uk-h2 sc-color-theme-dark">appollochina</a>
                <h3>Appollo (China) Co., Ltd. is a modern large-scale company specializing in the research and development, production and sales of advanced leisure health brands.
                    It was founded in 1996 and is based on the spirit of craftsmen. After more than 20 years of development, Appollo people trust "continuous improvement and innovation".
                    Entrepreneurial spirit continues to expand the scale of the company and create one after another
                    Apollo Co. (China) Co., Ltd. specializes in the research, development, innovation and production of leisure bath products. "Appollo" toilet is a famous brand in China and the world market. Jacuzzi, bathtub, shower faucet, bath equipment, bathroom cabinets and other products exported to more than 30 countries and regions including Germany, Britain, France, Saudi Arabia, Dubai, Iran, Poland, Russia, Ukraine, Hong Kong and Malaysia.</h3>
                <a href="https://www.pruvitnow.com/"target="_blank" class="uk-h2 sc-color-theme-dark">pruvit</a>
                <h3>Based on this core belief, the company decided to challenge the world of supplements by creating the world's top ketone supplement drink, KETO // OS®. We focus primarily on evidence-based products that help optimize your human resources.
                    Rovit is proud to be the world leader in the ketone industry as a pioneer in this new market. By focusing on society and the power of social business, our philosophy remains simple. Build people. Better.</h3>
                <a href="https://cosway.com.my/"target="_blank" class="uk-h2 sc-color-theme-dark">cosway</a>
                <h3>Kasavi is at the forefront of delivering the best quality and value because we want our consumers to live healthier and richer lives - smarter ways. We care, and we are constantly striving to improve and bring to market needs that are always changing and diversifying. Cosway, which has been constantly evolving our business strategies to drive growth for nearly 40 years, has been serving its customers with the same commitment, commitment and consistency.</h3>
                <a href="https://www.mikiprune.co.jp/"target="_blank" class="uk-h2 sc-color-theme-dark">mikiprune.co</a>
                <h3>Miki prune Banko was founded in 2013. Miki's social activities that give dreams and knowledge through books.
                    We will deliver this book to sales staff across the country in the hope that the children will be in good physical and mental health.
                    This is the seventh year that Miki has been offering books to children across the country. We have delivered 208 books, including abroad, and the number of books is 13,700</h3>
                <a href="https://us.amorepacific.com/"target="_blank" class="uk-h2 sc-color-theme-dark">amorepacific</a>
                <h3>AMOREPACIFIC Corp. Founded in September 1945 (AMOREPACIFIC), it was committed to becoming the "Asian Beauty Beauty" and providing global use of beauty and health solutions through 30 beauty, home and health care brands. Has been. AMOREPACIFIC Products is an advanced product research, development and distribution center that relies on its expertise in keeping with tradition and the modern student. The company joined the United Nations Global Compact in 2007 in pursuit of sustainable management in line with global standards, and in 2010 was inducted into the DJSI World Sustainability List.</h3>
                <a href="https://www.teamnationalusa.com/"target="_blank" class="uk-h2 sc-color-theme-dark">teamnational</a>
                <h3>The cornerstone of the DSA's commitment to ethical business practices and consumer services is its ethical principles. Each member company undertakes to comply with the standards and procedures of the code as a condition of admission and continued membership in the DSA.
                    The DSA code of ethics speaks to both the consumer and the seller. This ensures that member companies will not make any comments or promises about misleading potential consumers or sellers. Pyramid schemes are illegal and companies operating in the pyramid are not allowed to join the DSA.
                    The DSA code of conduct is executed by an independent code manager who has no affiliation with any of the member companies. The code manager does everything possible to resolve any complaints to the satisfaction of all involved and has the power to decide on treatment options. All member companies agree to respect the manager's decisions. We are one of the companies that comply with these rules every year and therefore proudly show the "DSA Ethical Communication Initiative, Certificate of Appreciation"</h3>
                <a href="https://www.longrichamerica.com/"target="_blank" class="uk-h2 sc-color-theme-dark">longrich</a>
                <h3>LONGRICH Bio-Science.Co, Ltd (Longrich) is located in LONGRICH Industrial Industrial Park. The area of this industrial park is more than 2000 MU (about 500 hectares). Longrich is proud of its annual production capacity of 20,000 tons of cosmetics, producing 500 million yuan a year, making Longrich one of the leading companies in the cosmetics industry in southern China. The company mainly works in the field of cosmetics, home cleaning products, health products, furniture, real estate jobs, logistics jobs and many other products.</h3>
                <a href="https://www.infinitus.my/en/"target="_blank" class="uk-h2 sc-color-theme-dark">infinitus global</a>
                <h3>Discover the new solution to a better life through Infinitus through a comprehensive mix of preventative natural health care treatments and techniques, just for yourself.
                    Superior quality with international standards, "100-1 = 0" is the principle of our quality management. From raw materials to packaging, no mistakes are allowed on the production trip. Most products must pass more than a thousand tests to ensure compliance with international quality and safety standards.</h3>
                <a href="http://pazhtazan.ir/"target="_blank" class="uk-h2 sc-color-theme-dark">paj Technology.co</a>
                <h3>Pajtazan Iman Cooperative Company was registered on 5/17/2006 with its headquarters in Mashhad (Iran) with the following goals and issues
                    The subject of the activity of the service company is very detailed and extensive, which can be briefly referred to the issues of services and administrative, financial, cultural and educational support. (Detailed below)
                    Also among the subsequent changes were the establishment of educational complexes and the establishment of online stores and financial and stock exchange activities, which were added to the cooperative based on the needs of the day.
                    Objectives of forming the Pagetazan Iman Cooperative:
                    Objectives at the time of establishment
                    1: Promoting and strengthening participation, cooperation and public cooperation
                    2: Meeting common economic, social and cultural needs and helping to achieve social justice
                    3: Creating employment for cooperative members</h3>
                <a href="https://corporate.vorwerk.com/en/home/"target="_blank" class="uk-h2 sc-color-theme-dark">vorwerkmlm</a>
                <h3>Sustainable strategies have always ensured success in Vorwerk family businesses. Our products stand for innovation and quality and have stimulated our customers for generations.
                    We create passionate and loyal customers by simplifying homes with quality and durable solutions. Our top products and services are human touch, from how they are produced and sold to how they are used. Our unique and direct sales capabilities empower people around the world and improve lives for the better. As a trusted family business, we are committed to being socially and environmentally responsible. We strive for economic success as a means of securing ownership of the Vorwerk family for future generations.</h3>

            </div>

        </div>
    </div>
</div>
<div id="academy" class="uk-modal-page uk-overflow-auto" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-full uk-close-large" type="button" uk-close></button>
        <div  uk-height-viewport>

            <div class="uk-container uk-container-large uk-padding-large" style="background-image: url('{{asset('assets/img/readme/bg_2.jpg')}}'); background-size: cover">
                <h3>With attackers employing more complex obfuscation techniques, cyberattacks are becoming more sophisticated than ever. Most organization’s people, process and technology cannot keep up with evolving cyber threats, odds are that your organization is exposed to a much higher risk, especially if it is short of talent who has the right set of strategies, experience and skills to mitigate the risk.

                    NetworksChains Academy was established to offer cybersecurity courses that help the industry address the talent gap. Our courses are a combination of online and onsite lecture, workshops, learning assessments, virtual laboratories, gamified challenges and cyber drills leveraging our Learning Management platform.</h3>
            </div>

        </div>
    </div>
</div>
<div id="grow" class="uk-modal-page uk-overflow-auto" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-full uk-close-large" type="button" uk-close></button>
        <div  uk-height-viewport>

            <div class="uk-container uk-container-large uk-padding-large" style="background-image: url('{{asset('assets/img/readme/bg_2.jpg')}}'); background-size: cover">
                <h3>Strategize, consider the available options, and build it into your business plan. Depending on the kind of company you're building, your growth strategy might include aspects like:

                    Adding new locations
                    Investing in customer acquisition
                    Franchising opportunities
                    Product line expansions
                    Selling products online across multiple platforms
                    Your particular industry and target market will influence your decisions, but it's almost universally true that new customer acquisition will play a sizable role.

                    Not sure what that looks like for your business? Here are some actionable tactics for achieving growth.</h3>
            </div>

        </div>
    </div>
</div>
<div id="contact" class="uk-modal-container uk-overflow-auto" uk-modal>
    <div class="uk-modal-container">
        <button class="uk-modal-close-full uk-close-large" style="color: white" type="button" uk-close></button>
        <div  uk-height-viewport>

            <div class="uk-container uk-container-large uk-padding-large uk-text-center">
                <h2 class=" uk-text-bold" style="color: #d8bc6f">CONTACT</h2>
                <section class="padding bg" id="sect-contact" >
                    <div class="uk-container">
                        <div data-uk-grid="" class="uk-grid">
                            <div class="uk-width-2-5@m uk-first-column">
                                <h3 class="uk-heading-line"><span>Address</span></h3>
                                <ul class="sc-list">
                                    <li>
                                        <div class="sc-list-icon">
                                            <svg style="width:32px;height:32px; fill: yellow" viewBox="0 0 24 24">
                                                <path d="M12,11.5A2.5,2.5 0 0,1 9.5,9A2.5,2.5 0 0,1 12,6.5A2.5,2.5 0 0,1 14.5,9A2.5,2.5 0 0,1 12,11.5M12,2A7,7 0 0,0 5,9C5,14.25 12,22 12,22C12,22 19,14.25 19,9A7,7 0 0,0 12,2Z"></path>
                                            </svg>
                                        </div>
                                        <address>
                                            5th Floor, Ossen International, Building A, No.925 Yunshui Yilu, Xi'an Hi-tech Zone, Yanta Disctrit, Xi'an, Shaanxi Province, China, 710003
                                        </address>
                                    </li>
                                    <li>
                                        <div class="sc-list-icon">
                                            <svg style="width:32px;height:32px" viewBox="0 0 24 24">
                                                <path d="M12,15C12.81,15 13.5,14.7 14.11,14.11C14.7,13.5 15,12.81 15,12C15,11.19 14.7,10.5 14.11,9.89C13.5,9.3 12.81,9 12,9C11.19,9 10.5,9.3 9.89,9.89C9.3,10.5 9,11.19 9,12C9,12.81 9.3,13.5 9.89,14.11C10.5,14.7 11.19,15 12,15M12,2C14.75,2 17.1,3 19.05,4.95C21,6.9 22,9.25 22,12V13.45C22,14.45 21.65,15.3 21,16C20.3,16.67 19.5,17 18.5,17C17.3,17 16.31,16.5 15.56,15.5C14.56,16.5 13.38,17 12,17C10.63,17 9.45,16.5 8.46,15.54C7.5,14.55 7,13.38 7,12C7,10.63 7.5,9.45 8.46,8.46C9.45,7.5 10.63,7 12,7C13.38,7 14.55,7.5 15.54,8.46C16.5,9.45 17,10.63 17,12V13.45C17,13.86 17.16,14.22 17.46,14.53C17.76,14.84 18.11,15 18.5,15C18.92,15 19.27,14.84 19.57,14.53C19.87,14.22 20,13.86 20,13.45V12C20,9.81 19.23,7.93 17.65,6.35C16.07,4.77 14.19,4 12,4C9.81,4 7.93,4.77 6.35,6.35C4.77,7.93 4,9.81 4,12C4,14.19 4.77,16.07 6.35,17.65C7.93,19.23 9.81,20 12,20H17V22H12C9.25,22 6.9,21 4.95,19.05C3,17.1 2,14.75 2,12C2,9.25 3,6.9 4.95,4.95C6.9,3 9.25,2 12,2Z"></path>
                                            </svg>
                                        </div>
                                        info@networkschains.com
                                    </li>
                                    <li>
                                        <div class="sc-list-icon">
                                            <svg style="width:32px;height:32px" viewBox="0 0 24 24">
                                                <path d="M6.62,10.79C8.06,13.62 10.38,15.94 13.21,17.38L15.41,15.18C15.69,14.9 16.08,14.82 16.43,14.93C17.55,15.3 18.75,15.5 20,15.5A1,1 0 0,1 21,16.5V20A1,1 0 0,1 20,21A17,17 0 0,1 3,4A1,1 0 0,1 4,3H7.5A1,1 0 0,1 8.5,4C8.5,5.25 8.7,6.45 9.07,7.57C9.18,7.92 9.1,8.31 8.82,8.59L6.62,10.79Z"></path>
                                            </svg>
                                        </div>
                                        +86-18411632866
                                    </li>
                                </ul>
                            </div>
                            <div class="uk-flex-1">
                                <h3 class="uk-heading-line"><span>Contact us</span></h3>
                                <form action="#">
                                    <div class="sc-input-wrapper uk-margin">
                                        <input class="uk-input" type="text" id="name" name="name" style="padding: 24px 12px 8px !important;">
                                        <label for="name">Your Name</label>
                                    </div>
                                    <div class="sc-input-wrapper uk-margin">
                                        <input class="uk-input" type="text" id="email" name="email" style="padding: 24px 12px 8px !important;">
                                        <label for="email">Your Email</label>
                                    </div>
                                    <div class="sc-input-wrapper uk-margin">
                                        <textarea class="uk-input" type="text" id="message" name="message"></textarea>
                                        <label for="message">Message</label>
                                    </div>
                                    <div class="uk-margin">
                                        <button class="sc-button black-btn">Send message</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

        </div>
    </div>
</div>
</body>
</html>

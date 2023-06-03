@extends('master')

@section('main')
{{--    palevioletred--}}

<style>
    #sc-header { background-color: #ffcc6e}

 </style>
    <div id="particles-js" style="    background:    transparent;
    height: 370px;
    position: absolute;
     width: 100% ; opacity: 1    "></div>



    <div  class="gradient top-section" style="height: 450px ; background: #ffcc6e ;  ">
        <div class="uk-container">
            <div class="uk-flex-middle uk-grid" data-uk-grid="">
                <div class="uk-width-2-5@m uk-first-column" style="padding-top: 30px!important;">
                    <h1>Build your own Network in our Platform</h1>
                    <h4>We are World's Most Popular Way for Network Marketing Business Development.</h4>
                    <div class="uk-container uk-flex" id="padd">
                        <a  href="{{route('page_show',['slug'=>'readme'])}}" class="sc-button sc-button-large sc-button-danger">Read More</a>
                        <a href=#" uk-toggle="target: #contact" class="active sc-button sc-button-outline sc-button-large uk-margin-left">Contact Us</a>
                    </div>
                </div>
                <div class="uk-width-3-5@m uk-flex uk-flex-right">
                    <img src="{{asset_url('img/undraw_connected_world_wuay.svg')}}" id="display" class="top-section-main-img" alt="">
                </div>
            </div>
        </div>
    </div>


    <section class="bg padding" id="sect-technologies">
        <div class="uk-container">
            <div class="uk-text-center">
                <h2 class="uk-margin-small-bottom">Successful technologies under our platform</h2>
                <p class="uk-margin-remove">Cyber security and data protection is our priority and that of all companies that use our platform.</p>
            </div>
            <div class="sc-logos">
                <a href="https://aeternity.com/" target="_blank"><img src="{{asset_url('img/html.png')}}" alt=""></a>
                <a href="https://chain.link/" target="_blank"><img src="{{asset_url('img/vue.png')}}" alt=""></a>
                <a href="https://district0x.io/" target="_blank"><img src="{{asset_url('img/nuxt.png')}}" alt=""></a>
                <a href="https://holochain.org/" target="_blank"><img src="{{asset_url('img/yarn.png')}}" alt=""></a>
                <a href="https://www.vechain.org/" target="_blank"><img src="{{asset_url('img/laravel.png')}}" alt=""></a>
                <a href="https://www.pamtree.com/" target="_blank"><img src="{{asset_url('img/webpack.png')}}" alt=""></a>
                <a href="https://www.edc.ca/" target="_blank"><img src="{{asset_url('img/sass.png')}}" alt=""></a>
            </div>
        </div>
    </section>

    <section class="bg">
        <div class="uk-container">
            <hr>
        </div>
    </section>

    <section class="bg padding" id="sect-about-us">
        <div class="uk-container">
            <div class="uk-width-2-3@m uk-text-center uk-margin-auto uk-margin-large-bottom">
                <h2>About us</h2>
                <p>By providing a dedicated CRM platform and panel for any type of business in all areas, we will help strengthen and prosper your economy and your business in a safe, independent and dedicated environment with what you need You are expanding worldwide and in the form of global network marketing.
                    We allow people anywhere in the world to get to know your business and introduce it to others, so they can make money and expand your business. By providing a completely independent and secure platform and environment, we will develop your business and with your advice,
                    we will globalize your business and give you the capabilities to be able to introduce your business in all the world and
                    countries without any restrictions and representatives. From all over the world for your business, considering the economy
                    of that region and their culture and needs, you can promote and introduce business. Our consultants will always and at all
                    times reach out to your representatives and develop your business and will provide them with good solutions according to the economy of that region.
                    We strive to develop and expand your business by providing a complete platform and environment for network marketing without any geographical,
                    cultural or economic restrictions.</p>
            </div>
            <div class="uk-child-width-1-2@s uk-child-width-1-4@m uk-grid-medium uk-grid" data-uk-grid="" data-uk-height-match="target: &gt; div &gt; .uk-card">
                <div class="uk-first-column">
                    <div class="uk-card sc-card-flat">
                        <div class="uk-card-header uk-flex uk-flex-column">
                            <div class="uk-width-1-3@m uk-margin-auto uk-text-center">
                                <img src="{{asset_url('img/diploma_2.svg')}}" alt="">
                            </div>
                            <h3 class="uk-card-title uk-text-center uk-margin-top">Representatives</h3>
                        </div>
                        <div class="uk-card-body">
                            <p>
                                Companies requesting an authorized representative to develop their business on our platform through the CRM panel
                            </p>
                            <a href=#" uk-toggle="target: #Representatives" class="active">Read more...</a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="uk-card sc-card-flat" style="min-height: 309.469px;">
                        <div class="uk-card-header uk-flex uk-flex-column">
                            <div class="uk-width-1-3@m uk-margin-auto uk-text-center">
                                <img src="{{asset_url('img/whitepaper.png')}}" alt="">
                            </div>
                            <h3 class="uk-card-title uk-text-center uk-margin-top">Whitepaper</h3>
                        </div>
                        <div class="uk-card-body">
                            <p>
                                “Becoming data-driven has become a general goal for many companies”, says Mike Rollings, research vice president at Gartner.
                            </p>
                            <a href=#" uk-toggle="target: #whitepaper-window" class="active">Read more...</a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="uk-card sc-card-flat" style="min-height: 309.469px;">
                        <div class="uk-card-header uk-flex uk-flex-column">
                            <div class="uk-width-1-3@m uk-margin-auto uk-text-center">
                                <img src="{{asset_url('img/voice_presentation.svg')}}" alt="">
                            </div>
                            <h3 class="uk-card-title uk-text-center uk-margin-top">Networkschains Academy</h3>
                        </div>
                        <div class="uk-card-body">
                            <p>
                                With attackers employing more complex obfuscation techniques, cyberattacks are becoming more sophisticated than ever.
                            </p>
                            <a href=#" uk-toggle="target: #academy" class="active">Read more...</a>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="uk-card sc-card-flat" style="min-height: 309.469px;">
                        <div class="uk-card-header uk-flex uk-flex-column">
                            <div class="uk-width-1-3@m uk-margin-auto uk-text-center">
                                <img src="{{asset_url('img/bullish.svg')}}" alt="">
                            </div>
                            <h3 class="uk-card-title uk-text-center uk-margin-top">Constant growth</h3>
                        </div>
                        <div class="uk-card-body">
                            <p>
                                Strategize, consider the available options, and build it into your business plan.
                            </p>
                            <a href=#" uk-toggle="target: #grow" class="active">Read more...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="bg">
        <div class="uk-container">
            <hr>
        </div>
    </section>

{{--    <section class="bg padding" style="background-color: #37474f">--}}
{{--        <div class="uk-container">--}}
{{--            <div class="uk-text-center">--}}
{{--                <h2 class="uk-margin-small-bottom" style="color: #ffcc6e">Check our latest work</h2>--}}
{{--                <p class="uk-margin-remove " style="color: white" >Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis, ipsa.</p>--}}
{{--            </div>--}}
{{--            <div class="uk-margin-large-top sc-slider uk-slider uk-slider-container" data-uk-slider="autoplay: true">--}}
{{--                <div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1">--}}
{{--                    <ul class="uk-slider-items uk-child-width-1-2@s uk-child-width-1-3@m uk-child-width-1-4@l uk-grid-medium uk-grid" data-uk-grid="" style="transform: translate3d(-307.5px, 0px, 0px);">--}}
{{--                        <li tabindex="-1" class="" style="order: 1;">--}}
{{--                            <div class="uk-card uk-card-default">--}}
{{--                                <div class="uk-card-media-top">--}}
{{--                                    <img src="{{asset_url('img/rachel-park-366508-unsplash_md_sq.jpg')}}" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="uk-card-body">--}}
{{--                                    <h3 class="uk-card-title">Headline</h3>--}}
{{--                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>--}}
{{--                                    <a href="##">Read more...</a>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </li>--}}
{{--                        <li tabindex="-1" class="uk-first-column" style="">--}}
{{--                            <div class="uk-card uk-card-default">--}}
{{--                                <div class="uk-card-media-top">--}}
{{--                                    <img src="{{asset_url('img/daria-kopylova-766667-unsplash_md_sq.jpg')}}" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="uk-card-body">--}}
{{--                                    <h3 class="uk-card-title">Headline</h3>--}}
{{--                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>--}}
{{--                                    <a href="##">Read more...</a>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </li>--}}
{{--                        <li tabindex="-1" class="uk-active" style="">--}}
{{--                            <div class="uk-card uk-card-default">--}}
{{--                                <div class="uk-card-media-top">--}}
{{--                                    <img src="{{asset_url('img/casey-horner-768005-unsplash_md_sq.jpg')}}" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="uk-card-body">--}}
{{--                                    <h3 class="uk-card-title">Headline</h3>--}}
{{--                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>--}}
{{--                                    <a href="##">Read more...</a>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </li>--}}
{{--                        <li tabindex="-1" class="uk-active" style="">--}}
{{--                            <div class="uk-card uk-card-default">--}}
{{--                                <div class="uk-card-media-top">--}}
{{--                                    <img src="{{asset_url('img/alex-guillaume-769172-unsplash_md_sq.jpg')}}" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="uk-card-body">--}}
{{--                                    <h3 class="uk-card-title">Headline</h3>--}}
{{--                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>--}}
{{--                                    <a href="##">Read more...</a>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </li>--}}
{{--                        <li tabindex="-1" class="" style="order: 1;">--}}
{{--                            <div class="uk-card uk-card-default">--}}
{{--                                <div class="uk-card-media-top">--}}
{{--                                    <img src="{{asset_url('img/rachel-park-366508-unsplash_md_sq.jpg')}}" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="uk-card-body">--}}
{{--                                    <h3 class="uk-card-title">Headline</h3>--}}
{{--                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>--}}
{{--                                    <a href="##">Read more...</a>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </li>--}}
{{--                        <li tabindex="-1" class="uk-first-column" style="">--}}
{{--                            <div class="uk-card uk-card-default">--}}
{{--                                <div class="uk-card-media-top">--}}
{{--                                    <img src="{{asset_url('img/daria-kopylova-766667-unsplash_md_sq.jpg')}}" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="uk-card-body">--}}
{{--                                    <h3 class="uk-card-title">Headline</h3>--}}
{{--                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>--}}
{{--                                    <a href="##">Read more...</a>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </li>--}}
{{--                        <li tabindex="-1" class="uk-active" style="">--}}
{{--                            <div class="uk-card uk-card-default">--}}
{{--                                <div class="uk-card-media-top">--}}
{{--                                    <img src="{{asset_url('img/casey-horner-768005-unsplash_md_sq.jpg')}}" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="uk-card-body">--}}
{{--                                    <h3 class="uk-card-title">Headline</h3>--}}
{{--                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>--}}
{{--                                    <a href="##">Read more...</a>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </li>--}}
{{--                        <li tabindex="-1" class="uk-active" style="">--}}
{{--                            <div class="uk-card uk-card-default">--}}
{{--                                <div class="uk-card-media-top">--}}
{{--                                    <img src="{{asset_url('img/alex-guillaume-769172-unsplash_md_sq.jpg')}}" alt="">--}}
{{--                                </div>--}}
{{--                                <div class="uk-card-body">--}}
{{--                                    <h3 class="uk-card-title">Headline</h3>--}}
{{--                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>--}}
{{--                                    <a href="##">Read more...</a>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </li>--}}
{{--                    </ul>--}}
{{--                    <a class="uk-position-center-left uk-position-small uk-hidden-hover uk-icon uk-slidenav-previous uk-slidenav" href="##" data-uk-slidenav-previous="" data-uk-slider-item="previous"><svg width="14px" height="24px" viewBox="0 0 14 24" xmlns="http://www.w3.org/2000/svg" data-svg="slidenav-previous"><polyline fill="none" stroke="#000" stroke-width="1.4" points="12.775,1 1.225,12 12.775,23 "></polyline></svg></a>--}}
{{--                    <a class="uk-position-center-right uk-position-small uk-hidden-hover uk-icon uk-slidenav-next uk-slidenav" href="##" data-uk-slidenav-next="" data-uk-slider-item="next"><svg width="14px" height="24px" viewBox="0 0 14 24" xmlns="http://www.w3.org/2000/svg" data-svg="slidenav-next"><polyline fill="none" stroke="#000" stroke-width="1.4" points="1.225,23 12.775,12 1.225,1 "></polyline></svg></a>--}}
{{--                </div>--}}
{{--                <ul class="uk-slider-nav uk-dotnav uk-flex-center uk-margin-medium-top"><li uk-slider-item="0" class=""><a href="#"></a></li><li uk-slider-item="1" class=""><a href="#"></a></li><li uk-slider-item="2" class=""><a href="#"></a></li><li uk-slider-item="3" class=""><a href="#"></a></li><li uk-slider-item="4" class=""><a href="#"></a></li><li uk-slider-item="5" class=""><a href="#"></a></li><li uk-slider-item="6" class=""><a href="#"></a></li><li uk-slider-item="7" class="uk-active"><a href="#"></a></li><li uk-slider-item="8" class=""><a href="#"></a></li></ul>--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </section>--}}




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
    <script src="{{asset_url('js/particles.js')}}"></script>
    <script src="{{asset_url('js/particle/app.js')}}"></script>
    <script src="{{asset_url('js/particle/lib/stats.js')}}"></script>

    <script>
        var count_particles, stats, update;
        stats = new Stats;
        update = function() {
            requestAnimationFrame(update);
        };
        requestAnimationFrame(update);
    </script>
@endsection

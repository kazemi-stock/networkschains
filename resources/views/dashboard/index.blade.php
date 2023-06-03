@extends( 'master')
@section('header')
    <script type="text/javascript" src="{{asset_url('treeviz/dist/index.js')}}"></script></body>
@endsection
@section('main')


    <div class="uk-container  ">

        <style>
            .opacity { opacity: 0.2 }
        </style>


        <div class="uk-child-width-1-3@m uk-child-width-1-1@s uk-text-center uk-grid-match uk-hidden@m" uk-grid>

            <div>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-header uk-text-bold" style="background-color: #ffcc6e ">
                        {{--                        <span class=" uk-margin-small-right uk-icon-button uk-button-default" uk-icon="icon:  credit-card;"></span>  --}}
                        Total Points  :

                    </div>

                    <div class="uk-card-body">
                        <div class="uk-padding-small">
                            {{Auth::user()->total_point}}
                        </div>
                    </div>
                </div>
            </div>


            <div>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-header uk-text-bold" style="background-color: #ffcc6e ">
                        {{--                        <span class=" uk-margin-small-right uk-icon-button uk-button-default" uk-icon="icon:  credit-card;"></span>  --}}
                        Total Balance  :

                    </div>

                    <div class="uk-card-body">
                        <div class="uk-padding-small">
                            <div class="uk-grid-divider uk-child-width-1-2  " uk-grid>
                                <div>
                                    Left
                                    <br />
                                    {{isset($balance['left']['total_points'])?$balance['left']['total_points']:0}}
                                </div>

                                <div>
                                    Right
                                    <br />
                                    {{isset($balance['right']['total_points'])?$balance['right']['total_points']:0}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-header uk-text-bold" style="background-color: #ffcc6e ">
                        {{--                        <span class=" uk-margin-small-right uk-icon-button uk-button-default" uk-icon="icon:  credit-card;"></span> --}}
                        Current Balance  :

                    </div>

                    <div class="uk-card-body">
                        <div class="uk-padding-small">
                            <div class="uk-grid-divider uk-child-width-1-2  " uk-grid>
                                <div>
                                    Left
                                    <br />
                                    {{$balance['left']['points']}}
                                </div>

                                <div>
                                    Right
                                    <br />
                                    {{$balance['right']['points']}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <div uk-grid>
            <div class="uk-width-1-1 uk-text-center">

                <div id="tree" style="height:600px;max-width: 650px ; width: 100% ; margin: 0 auto ; overflow: auto  ">


                </div>
                <script>
                    var prev_data = JSON.parse('{!! ($inject) !!}');
                    var current_data = JSON.parse('{!! ($inject) !!}');


                    function create_tree(tree_data){

                        $('#tree').html('');
                        var myTree = Treeviz.create({
                            htmlId: "tree",
                            idKey: "id",
                            hasFlatData: true,
                            relationnalField: "father",
                            nodeWidth:120,
                            hasPan:true,
                            hasZoom: false,
                            nodeHeight:80,
                            duration : 3000 ,
                            mainAxisNodeSpacing:2,
                            isHorizontal:true ,
                            renderNode: function(node) {
                                return result = "<div class='box tree-node' data-node='"+node.data.text_1+"' style='cursor:pointer;height:"+node.settings.nodeHeight+"px; width:"+node.settings.nodeWidth+"px;display:flex;flex-direction:column;justify-content:center;align-items:center;background-color:"
                                    +node.data.color+
                                    ";border-radius:20px;'><div><strong>"
                                    +node.data.text_1+
                                    "</strong></div></div>";
                            },
                            linkWidth : (nodeData)=> 5,
                            linkShape:"quadraticBeziers",
                            linkColor : (nodeData) => nodeData.linkColor || "#B0BEC5",
                            onNodeClick : (nodeData) => console.log(nodeData)
                        });
                        myTree.refresh(tree_data);

                    }

                    create_tree(current_data);


                    $(document).on('click' , '.tree-node' , function(data){

                       let node = $(this).data('node') ;
                      if( node == 'Free' || node == 'You' || node == 'Parent')
                          return  ;

                      if(  $('#tree').hasClass('opacity'))
                          return  ;

                      $('#tree').addClass('opacity');
                      $.post('{{route('dashboard.child.tree')}}' , csrf({node : node }) , function (data){
                          $('#tree').removeClass('opacity');

                          data = $.parseJSON(data);

                          if(data.stat == 'ok')
                          {
                              prev_data = current_data ;
                              current_data = data.inject ;


                              console.log('recreating ... ');
                              create_tree(data.inject);
                          }
                      })

                    })



                </script>


            </div>

        </div>

        <div class="uk-child-width-1-3@m uk-child-width-1-1@s uk-text-center uk-grid-match uk-visible@m uk-margin-bottom" uk-grid>

            <div>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-header uk-text-bold" style="background-color: #ffcc6e ">
{{--                        <span class=" uk-margin-small-right uk-icon-button uk-button-default" uk-icon="icon:  credit-card;"></span>  --}}
                        Total Points  :

                    </div>

                    <div class="uk-card-body">
                        <div class="uk-padding-small">
                            {{Auth::user()->total_point}}
                        </div>
                    </div>
                </div>
            </div>


            <div>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-header uk-text-bold" style="background-color: #ffcc6e ">
{{--                        <span class=" uk-margin-small-right uk-icon-button uk-button-default" uk-icon="icon:  credit-card;"></span>  --}}
                        Total Balance  :

                    </div>

                    <div class="uk-card-body">
                        <div class="uk-padding-small">
                            <div class="uk-grid-divider uk-child-width-1-2  " uk-grid>
                                <div>
                                    Left
                                    <br />
                                    {{isset($balance['left']['total_points'])?$balance['left']['total_points']:0}}
                                </div>

                                <div>
                                    Right
                                    <br />
                                    {{isset($balance['right']['total_points'])?$balance['right']['total_points']:0}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-header uk-text-bold" style="background-color: #ffcc6e ">
{{--                        <span class=" uk-margin-small-right uk-icon-button uk-button-default" uk-icon="icon:  credit-card;"></span> --}}
                        Current Balance  :

                    </div>

                    <div class="uk-card-body">
                        <div class="uk-padding-small">
                            <div class="uk-grid-divider uk-child-width-1-2  " uk-grid>
                                <div>
                                    Left
                                    <br />
                                    {{$balance['left']['points']}}
                                </div>

                                <div>
                                    Right
                                    <br />
                                    {{$balance['right']['points']}}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>


    </div>

@endsection

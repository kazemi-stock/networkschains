@extends('cp.master')


@section('main')

    <div class="container-fluid">
        <!-- ============================================================== -->
        <!-- Start Page Content -->
        <!-- ============================================================== -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="border-bottom">
                        <h4 class="card-title">{{$ticket->title}}</h4>
                    </div>
                    <div class="card-body">
                        <div class="chat-box scrollable" style="height:475px;">
                            <!--chat Row -->
                            <ul class="chat-list" id="chat-list">
                                <!--chat Row -->

                                @include('cp.include.ticket-dialog-index')




                            </ul>
                        </div>
                    </div>
                    <div class="card-body border-top">
                        <div class="row">
                            <div class="col-9">
                                <div class="input-field m-t-0 m-b-0">
                                    <textarea id="dailog-text" placeholder="متن پاسخ .... " class="form-control border-0"></textarea>
                                </div>
                            </div>
                            <div class="col-3">
                                <a class="btn btn-lg btn-success float-left save-ticket-dialog-btn" data-route="{{route('cp_ticket_store_replay',['id'=>$ticket->id ])}}" >
                                    <span class="nospiner">ارسال پاسخ</span>
                                    <div class="spinner-border   spiner" role="status" >
                                        <span class="sr-only"></span>
                                    </div>
                                </a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).on('click' , '.save-ticket-dialog-btn' , function(){
            let data = {
                text : $('#dailog-text').val()
            } ;
            var btn = $(this);

            loadspiner(btn);
            $.post( btn.data('route') , csrf(data) , function(data){
                unloadspiner(btn);
                data = $.parseJSON(data);
                if(data.stat == 'ok')
                {
                    $('#chat-list').html(data.html);
                    ok('با موفقت ارسال شد ');
                    $('#dailog-text').val('');
                }
                else
                    er(data.msg);
            });


        })

    </script>


@endsection

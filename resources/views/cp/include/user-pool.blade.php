<div class="card dark-card">
    <div class="card-header">تغییر استخر کاربر</div>
    <div class="card-body">
        <div class="row">
            <div class="form-group row">
                <label for="fname" class="col-sm-12 text-right control-label col-form-label yekan" >انتخاب کنید</label>
                <div class="col-sm-12">
                    {!! select($pools , ['class'=>'form-controller pool-update-input' , 'data-id' => 'pool_id' ] , $user->CurrentPool ? $user->CurrentPool->pool_id : 0  ) !!}
                </div>
            </div>
        </div>
        <hr />
        {!! button( ['attr'=> [ 'class' => 'btn btn-primary store-btn'  , 'data-selector'=>'.pool-update-input' ,  'data-route'=> route('cp.user.pool.update' ,['id'=>$user->id]) ],'text'=>'تغییر استخر کاربر ' ]) !!}
    </div>
</div>
<div class="card dark-card">
    <div class="card-header">تاریخچه</div>
    <div class="card-body">
        <table class="table table-striped">
            <tr>
                <th>تاریخ</th>
                <th>استخر</th>
                <th>توضیحات</th>
                <th>درآمد</th>
            </tr>
            @foreach($user_pools as $user_pool )
                <tr>
                    <td>{{jdate($user_pool->created_at)}}</td>
                    <td> {{$user_pool->Pool->title}}</td>
                    <td>{{$user_pool->text}}</td>
                    <td>{{$user_pool->commission}}</td>
                </tr>

            @endforeach
        </table>


    </div>
</div>

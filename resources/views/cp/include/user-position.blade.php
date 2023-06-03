<div class="card dark-card">
    <div class="card-header">پوزیشن کاربر</div>
    <div class="card-body">
        <label>پدر</label>
        {!! select($all_users , ['class'=>'form-control pos-input' ,'data-id'=>'parent_id'] , $userParent ? $userParent->parent_id : 0 , $default = 1  ,$def_text = 'انتخاب کنید' , $label  = 'name') !!}
        <hr />
        <label>مکان</label>
        {!! select(['left'=>'چپ' , 'right'=>'راست'] , ['class'=>'form-control pos-input' ,'data-id'=>'position'] , $userParent ? $userParent->position : 0 ) !!}
        <hr />
        {!! button( ['attr'=> [ 'class' => 'btn btn-primary store-btn'  , 'data-selector'=>'.pos-input' ,  'data-route'=> route('cp.user.position.update' , ['id'=>$user->id ]) ],'text'=>'تغییر پدر ' ]) !!}

    </div>
</div>

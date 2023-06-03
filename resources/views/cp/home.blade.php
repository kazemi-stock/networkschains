@extends('cp.master')
@section('main')

    <div class="container-fluid">
    <div class="row">
    @foreach($stats as $stat )
        <div class="col-3">
        <div class="card">
            <div class="card-header">{{$stat['title']}}</div>
            <div class="card-body">{{$stat['value']}}</div>
        </div>
        </div>
    @endforeach
    </div>
    </div>
@endsection



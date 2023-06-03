@extends('master')


@section('main')


    <div class="uk-container bg-light img img-thumbnail uk-margin-medium-top uploader-wrapper">

        <h1 class="uk-padding-small">{{$page->title}}</h1>
        <hr />

        {!! $page->text !!}

    </div>



@endsection

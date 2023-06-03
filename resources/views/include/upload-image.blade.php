<table class="table table-white uk-table uk-table-bordered uk-table-divider uk-table-right  no-header success-upload" data-token="{{$token}}" data-type="image">
    <tr>
        <th>عکس</th>
        <th width="60%">عنوان</th>
        @if(isset($deletable))
        <th>حذف</th>
        @endif
        <th>ویرایش</th>
    </tr>
    <tr>
        <td> <img class="upload-image" src="{{upload_url( $file_name)}}" style="max-width: 50px ; max-height: 50px"> </td>
        <td> {{$original_name}}</td>
        @if(isset($deletable))
        <td><a class="fas fa-window-close upload-deleteable-btn" ></a></td>
        @endif
        <td><a class="fas fa-edit uploader-reset" ></a> </td>
    </tr>
</table>

<?php

namespace App\Admin\Controllers\Backend;

use App\Http\Controllers\Controller;
use Brazzer\Admin\Controllers\Dashboard;
use Brazzer\Admin\Layout\Column;
use Brazzer\Admin\Layout\Content;
use Brazzer\Admin\Layout\Row;
use Brazzer\Admin\Widgets\InfoBox;
use Brazzer\Admin\Widgets\Alert;
use Brazzer\Admin\Widgets\Callout;
use App\User;
use App\Models\Picture;
use App\Models\Tag;
use App\Models\Category;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->header('Bảng điều khiển')
            ->description('...')
            ->row(function (Row $row) {
                $words = 'Hệ thống đang trong quá trình triển khai và nâng cấp tính năng, mọi yêu cầu hoặc đóng góp ý kiến vui lòng gửi về địa chỉ hòm thư: tungdt2@bambooairways.com.<br>Số điện thoại IT support: 0345.513.889';
                $row->column(12, function (Column $column) use ($words) {
                    $column->append((new Callout($words))->style('success'));
                });
            })
            ->row(function (Row $row) {
                $row->column(3, new InfoBox('Quản trị viên', 'users', 'aqua', 'admin/auth/users', User::all()->count()));
                $row->column(3, new InfoBox('Hình vẽ', 'book', 'green', '/admin/pictures', Picture::all()->count()));
                $row->column(3, new InfoBox('Thẻ đính kèm', 'tag', 'yellow', '/admin/tags', Tag::all()->count()));
                $row->column(3, new InfoBox('Danh mục hình vẽ', 'file', 'red', '/admin/categories', Category::all()->count()));
            });
    }
}

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

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->header('Dashboard')
            ->description('Description...')
            ->row(function (Row $row) {
                $row->column(3, new InfoBox('New Users', 'users', 'aqua', '/demo/users', '1024'));
                $row->column(3, new InfoBox('New Orders', 'shopping-cart', 'green', '/demo/orders', '150%'));
                $row->column(3, new InfoBox('Articles', 'book', 'yellow', '/demo/articles', '2786'));
                $row->column(3, new InfoBox('Documents', 'file', 'red', '/demo/files', '698726'));
            })->row(function (Row $row) {
                $words = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non,
                facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam,
                orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus.';
                $row->column(6, function (Column $column) use ($words) {
                    $column->append(new Alert($words));
                });
                $row->column(6, function (Column $column) use ($words) {
                    $column->append(new Callout($words));
                    $column->append((new Callout($words))->style('warning'));
                });
            });
    }
}

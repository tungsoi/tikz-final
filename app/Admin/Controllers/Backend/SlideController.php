<?php

namespace App\Admin\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Picture;
use Brazzer\Admin\Form;
use Brazzer\Admin\Grid;
use Brazzer\Admin\Layout\Content;
use Brazzer\Admin\Show;
use Brazzer\Admin\Controllers\ModelForm;
use App\Models\Slide;
use Illuminate\Support\Str;

class SlideController extends Controller
{
    use ModelForm;

    public function __construct()
    {
        //
    }

    /**
     * Return page index
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('Slide Hình vẽ')
            ->description('Danh sách')
            ->body($this->grid());
    }

    /**
     * Return page edit
     *
     * @param Integer $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header('Slide Hình vẽ')
            ->description('Chỉnh sửa')
            ->body(
                $this->form()->edit($id)
            );
    }

    /**
     * Return page create
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header('Slide Hình vẽ')
            ->description('Tạo mới')
            ->body($this->form());
    }

    /**
     * Build table in page index
     *
     * @return Grid
     */
    protected function grid()
    {
        return Slide::grid(function(Grid $grid)
        {
            $grid->model()->orderBy('id', 'desc');
            $grid->filter(function($filter){
                $filter->expand();
                $filter->disableIdFilter();
                $filter->like('name');
            });

            $grid->picture_id('Hình vẽ')->display(function () {
                return $this->picture->title;
            });
            $grid->order('Thứ tự xuất hiện')->editable();
        });
    }

    /**
     * Build form for edit or create
     *
     * @return Form
     */
    public function form()
    {
        return Slide::form(function (Form $form)
        {
            $form->select('picture_id', 'Hình vẽ')->options(Picture::all()->pluck('title', 'id'));
            $form->number('order');

            $form->footer(function ($footer)
            {
                $footer->disableViewCheck();
                $footer->disableEditingCheck();
                $footer->disableCreatingCheck();
            });

        });
    }

    /**
     * Return page detail
     *
     * @param Integer $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header('Slides')
            ->description(trans('admin.detail'))
            ->body(
                    $this->detail($id)
            );
    }

    /**
     * Build detail contact form
     *
     * @param Integer $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Slide::findOrFail($id));

        $show->picture_id('Hình vẽ')->as(function () {
            return $this->picture->title;
        });
        $show->order('Thứ tự xuất hiện');

        return $show;
    }
}

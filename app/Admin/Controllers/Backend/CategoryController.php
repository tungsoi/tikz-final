<?php

namespace App\Admin\Controllers\Backend;

use App\Http\Controllers\Controller;
use Brazzer\Admin\Form;
use Brazzer\Admin\Grid;
use Brazzer\Admin\Layout\Content;
use Brazzer\Admin\Show;
use Brazzer\Admin\Controllers\ModelForm;
use App\Models\Category;
use Illuminate\Support\Str;

class CategoryController extends Controller
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
            ->header('Danh mục hình vẽ')
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
            ->header('Danh mục hình vẽ')
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
            ->header('Danh mục hình vẽ')
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
        return Category::grid(function(Grid $grid)
        {
            $grid->model()->orderBy('id', 'desc');
            $grid->filter(function($filter){
                $filter->expand();
                $filter->disableIdFilter();
                $filter->like('name');
            });

            $grid->name('Tên');
            $grid->code('Slug');
            $grid->created_at('Ngày tạo');

        });
    }

    /**
     * Build form for edit or create
     *
     * @return Form
     */
    public function form()
    {
        return Category::form(function (Form $form)
        {
            $form->hidden('id', 'ID');
            $form->text('name', 'Tên');

            $form->saving(function ($form) {
                Category::create([
                    'name'  =>  $form->name,
                    'code'  =>  Str::slug($form->name)
                ]);
                return back()->with(compact('success'));
            });

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
            ->header('Danh mục hình vẽ')
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
        $show = new Show(Category::findOrFail($id));
        $show->id('ID');
        $show->name('Tên');
        $show->code('Slug');
        $show->created_at('Ngày tạo');
        return $show;
    }
}
